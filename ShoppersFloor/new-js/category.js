$(document).ready(function () {


		
		$("a[data='"+$('#pTypeNav').text().trim()+"']").css('color','rgba(252,178,104,1)');
		//for display loading image while ajax calling.
        $("#loading-div-background").css({ opacity: 0.4 });
        $(document).ajaxStart(function () {
            $("#loading-div-background").show();
        });
        $(document).ajaxComplete(function () {
            $("#loading-div-background").hide();
        });

		// Ajax on click on brand links
        $(".lnkbtn_category").on("click", function () {
            
            $('#error').val('false');
            $("#PType").val('');
            $('#sortPrice').val('');
            $('#range').val('');
            var brand = $(this).text();
            var cat = $("#catNav").text();
            var subCat = $("#subCatNav").text();
            url = path+"CategoriesScroll";
            $.ajax({
                url: url,
                data: { PBrand: brand, cat: cat, subCat: subCat, pageNo: 0 },
                async: false
            }).done(function (msg) {
                $("#ContentPlaceHolder1_categories").html($(msg).filter("#categories").html());
                $("#PBrand").val($(msg).filter("#PBrand").val());
            });
        });
		// Ajax calling  for sorting by ascending or descending	
		 $("#price_select").on("change", function () {
            $('#error').val('false');
            var SortPrice = $(this).val();
            $('#sortPrice').val(SortPrice);
            var cat = $("#catNav").text();
            var subCat = $("#subCatNav").text();
            var PType = $("#PType").val();
            var PBrand = $("#PBrand").val();
            if (SortPrice != 0) {
                url = path+"CategoriesScroll";
                $.ajax({
                    url: url,
                    data: { SortPrice: SortPrice, cat: cat, subCat: subCat, PType: PType, PBrand: PBrand, pageNo: 0 },
                    async: false
                }).done(function (msg) {
                    $("#ContentPlaceHolder1_categories").html($(msg).filter("#categories").html());
                    $("#pageNo").val($(msg).filter("#pageNo").val());
                }); ;
            }
        });
		// Ajax calling to sort by price
		$("#priceRangeBtn").on("click", function () {
            $('#error').val('false');
            var th = $(this);
            var cat = $("#catNav").text();
            var subCat = $("#subCatNav").text();
            var PType = $("#PType").val();
            var PBrand = $("#PBrand").val();
			var min=$("#minTxt").val();
			var max=$("#maxTxt").val();
			if(min.length==0||min.length==0)
			{
				$('#errRange').css('display','block');
				return;
			}
			$('#errRange').css('display','none');
            url = path+'CategoriesScroll';
            $.ajax({
                url: url,
                data: { min:min, max:max, cat: cat, subCat: subCat, PType: PType, PBrand: PBrand, pageNo: 0 },
                async: false,
                error: function (err) {
                    $("#loading-div-background").hide();
                    $("#ContentPlaceHolder1_categories").html($("#message_main_box").removeClass("notfound"));
                }
            }).done(function (msg) {
                if ($(msg).find($("#ContentPlaceHolder1_categories tbody tr").length > 0)) {
                    $("#ContentPlaceHolder1_categories").html($(msg).filter("#categories").html());
                    $("#pageNo").val($(msg).filter("#pageNo").val());
                    $(th).attr("checked", true);
                }

            }); 
        });
		
		var a;
		$(window).scroll(function (e) {
			if ($(document).height() - 60 <= $(window).scrollTop() + $(window).height()) {
				loadProduct();
				
			}
		});
		$("a[name='saveLater']").on('click',function(){
			
			var sku1=$(this).attr('sku');
				$.ajax({ method: 'POST', url: path+'sfloor/pages/AjaxService.aspx?action=addFav', data: {sku:sku1}})
					.success(function (msg) {
					if(msg=="Exist")
					{
						return;
					}
					var json=JSON.parse(msg)
					if(msg.length>0){
						var div= "<div>"+
							"<a href='"+path+"?htm="+json.sku+"'><img  src='"+serverPath+json.image+"' width='30px' height='30px'/>"+
							"<p class='brand'>"+json.brand+"</p>"+
							"<p class='empty'>"+json.name+"</p>"+
							"<p class='subtotal'>"+
							   "MRP <span class='price'>Rs. "+json.mrp+"</span>"+
							   "Actual Price <span class='price'>Rs. "+json.price+"</span>"+
							 "</p>"+
						"</div>";
						}
						$("#wishListDiv").append(div);
						
						var count =$("#favCount").text();
						count=parseInt(count)+1;
						$("#favCount").text(count);
					});
		});
		
    });
	
// for load product on demand by scrolling
function loadProduct() {
	var pageNo = $("#pageNo").val();
	var cat = $("#catNav").text();
	var subCat = $("#subCatNav").text();
	var brand = $("#PBrand").val();
	var ptype = $('#PType').val();
	var SortPrice = $('#sortPrice').val();
	var Range = $('#range').val();
	if ($('#error').val() == 'true')
		return;
	url = path+"CategoriesScroll";
	$.ajax({
		url: url,
		async: false,
		data: { cat: cat, subCat: subCat, pageNo: pageNo, PBrand: brand, PType: ptype, SortPrice: SortPrice, Range: Range },
		error: function (err) {
			$('#error').val('true');
			$("#loading-div-background").hide();
		}
	}).done(function (msg) {
		// alert($(msg).filter("#categories").html());
		if ($(msg).filter("#categories").html() != undefined) {
			$("#ContentPlaceHolder1_categories").append($(msg).filter("#categories").html());
			$("#pageNo").val($(msg).filter("#pageNo").val());
		}
	});
}
