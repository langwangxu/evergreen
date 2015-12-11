//form validation by xuxw 20151113
/**
 * 全局变量声明
 */
var name_valiok = false,phone_valiok = false;

/**
 * 验证结果消息判断及UI组装展示 开始
 * @param 表单jquery对象
 * @param 验证结果消息
 * @returns {Boolean} 验证通过：true；验证失败：false
 */
function dealMessage(obj,message){
	var valiok = false;
	if(message != ""){
		obj.parents(".form-group").removeClass().addClass("form-group has-error has-feedback");
		obj.parent().find("span").removeClass().addClass("glyphicon glyphicon-remove form-control-feedback");
		obj.parents(".form-group").find("label:last").html(message);
	}else{
		valiok = true;
		obj.parents(".form-group").find("label:last").html("");
		obj.parents(".form-group").removeClass().addClass("form-group has-success has-feedback");
		obj.parent().find("span").removeClass().addClass("glyphicon glyphicon-ok form-control-feedback");
	}
	return valiok;
}
/**
 * 验证结果消息判断及UI组装展示 结束
 */

/**
 * ☆☆☆☆☆
 * 验证处理函数列表 开始
 * 这一部分是开发人员需要关注编写的
 */
	//用户名验证 开始
	function vali_name(){
		var mess = "";
		var vipName = $("#name");
		if(vipName.val() == null || vipName.val().length == 0){
			mess = "vip会员姓名不能为空，请填上.";
		}else if(vipName.val().length > 50){
			mess = "会员名称最大长度不能超过50个字符，请调整.";
		}
		name_valiok = dealMessage(vipName,mess);
	}
	//用户名验证 结束
	//卡号验证 开始
	/*function vali_card(){
		var mess = "";
		var vipCard = $("#card");
		if(vipCard.val() == null || vipCard.val().length == 0){
			mess = "卡号不能为空，请填上.";
		}else if(vipCard.val().length > 4){
			mess = "卡号最大长度不能超过4个字符，请调整.";
		}else{
			$.ajax({
				type:"post",
				contentType:"application/json",
				url:"<%=request.getContextPath()%>/vip/valid",
				processData:false,
				dataType:"json",
				data:"{card:'0010'}",
				beforeSend:function(){
					alert("begin to ajax …… ");
				},
				success:function(){
					mess = "success";
				},
				error:function(){
					mess = "error";
				}
			});
		}
		card_valiok = dealMessage(vipCard,mess);
	}*/
	//卡号验证 结束
	//手机号验证 开始
	function vali_phone(){
		var mess = "";
		var vipPhone = $("#phone");
		if(vipPhone.val() == null || vipPhone.val().length == 0){
			mess = "手机号不能为空，请填上.";
		}else if(vipPhone.val().length > 11){
			mess = "手机号最大长度不能超过11个字符，请调整.";
		}
		phone_valiok = dealMessage(vipPhone,mess);
	}
	//手机号验证 结束
/**
 * 验证处理函数列表 结束
 */

/**
 * 表单提交处理函数 开始
 */
	function to_submit(){
		$("#name").blur();
		$("#phone").blur();
		if(name_valiok&&phone_valiok){
			$("form").submit();
		}else{
			alert("表单有错误，请修正后，再点击我哦！");
			return false;
		}
	}
/**
 * 表单提交处理函数 结束
 */

/**
 * jquery 初始化开始
 */
	$(function(){
		$("#name").blur(vali_name);
		$("#phone").blur(vali_phone);
		$("#btn_save").on("click",to_submit);
	});
/**
 * jquery 初始化结束
 */