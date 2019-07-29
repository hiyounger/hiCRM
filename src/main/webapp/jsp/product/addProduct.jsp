<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>" />
    <meta charset="UTF-8">
    <title>新建产品</title>
    
	<meta name="pragma" content="no-cache">
	<meta name="cache-control" content="no-cache">
	<meta name="content-type" content="text/html;charset=UTF-8">
	<meta name="expires" content="0">
	  <base href="<%=basePath%>">
	  <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
	  <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">

	  <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	  <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	  <script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
	 <%-- D:\idea\crm\src\main\webapp\addProduct.jsp--%>

	  <style type="text/css">
		  #ff{
			  margin-top: -100px;
		  }

	  </style>
  </head>
  
  <body style="width:100%;max-width:600px;padding:30px 60px">
	<section class="info-section">
		<div class="column" align="center">
			<span class="current" style="font-size: 1.35em">基本信息</span>
		</div>
		<div align="center">

			<form id="ff" method="post">
				<table>
					<tr>
						<td>是否上下架</td>
						<td>产品名称</td>
					</tr>
					<tr>
						<td class="kv-content">    <%--使用easyui下拉选项框  并且只能选择，不能编辑  class="easyui-combobox" editable="false"--%>
							<select name="productState" id="productState" class="easyui-combobox" editable="false" style="width:171px">
								<option value="-1">请选择</option>
								<option value="1">上架</option>
								<option value="0">下架</option>
							</select>
						</td>
						<td class="kv-content">
							<input type="text" id="productName" name="productName" placeholder="请输入" class="easyui-textbox">
						</td>
					</tr>

					<tr>
						<td>单位</td>
						<td>产品类型</td>
					</tr>

					<tr>
						<td class="kv-content">
							<%--<input type="text" id="unit" name="unit" placeholder="请输入" >--%>
							<select name="unit" id="unit" placeholder="请输入" class="easyui-combobox" editable="false" style="width:171px">
								<option value="-1">请选择</option>
								<option value="1">上架</option>
								<option value="0">下架</option>
							</select>
						</td>
						<td class="kv-content">
							<%--<select name="productType" id="productType" placeholder="请输入" style="width:171px" class="easyui-validatebox  easyui-combobox" data-options="validType:'selectRequired'" editable="false">--%>
							<select name="productType" id="productType" placeholder="请输入" style="width:171px" class="easyui-combobox" editable="false">
								<option value="-1">请选择</option>
								<option value="1">上架</option>
								<option value="0">下架</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>产品编码</td>
						<td>价格</td>
					</tr>

					<tr>
						<td class="kv-content">
							<input type="text" id="productId" name="productId" placeholder="请输入"  class="easyui-validatebox  easyui-textbox" data-options="required:true,validType:'isNumber'" >
						</td>
						<td class="kv-content">
							<input type="text" id="standardPrice" name="standardPrice" placeholder="请输入" class="easyui-validatebox  easyui-textbox" data-options="required:true,validType:'isNumber'">
						</td>
					</tr>

					<tr>
						<td>产品描述</td>
						<td>创建时间</td>
					</tr>
					<tr>
						<td class="kv-content">
							<input type="text" id="description" name="description" placeholder="请输入" class="easyui-textbox">
						</td>
						<td class="kv-content">     <%--disabled="true" 会使数据不能传到后台，所以用readonly--%>
							<input type="text" id="createTime" name="createTime" placeholder="请输入" readonly="true" class="easyui-textbox">
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
							<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
						</td>
					</tr>
				</table>
			</form>

		</div>

	</section>
	<script type="text/javascript">

        //自定义表单验证
    /*   $(document).ready(function(){
            $.extend($.fn.validatebox.defaults.rules, {

                A: {
                    validator: function(value, param) {
                        console.info($(param[0]).find("option:contains('"+value+"')").val());
                        return $(param[0]).find("option:contains('"+value+"')").val() != '';
                    },
                    message: "该输入项是必填项！"
                }
            });

        });*/

        var myDate = new Date();
        var date = myDate.getFullYear()
            + "-"
            + ((myDate.getMonth() + 1) < 10 ? "0" + (myDate.getMonth() + 1)
                : (myDate.getMonth() + 1))
            + "-"
            + (myDate.getDate() < 10 ? "0" + myDate.getDate() : myDate
                .getDate())
            + " "
            + (myDate.getHours()< 10 ? "0" + myDate.getHours() : myDate.getHours())
            + ":"
            + (myDate.getMinutes() < 10 ? "0" + myDate.getMinutes() : myDate.getMinutes())
            + ":"
            + (myDate.getSeconds() < 10 ? "0" + myDate.getSeconds() : myDate.getSeconds())
        $("input[name=createTime]").val(date);

		$(function() {
			
			
		});


       //提交表单
        function submitForm(){
            //ajax提交
            var data1=$("ff").serialize();
            $('#ff').form('submit',{
                // contentType: "application/json;charset=UTF-8",
                url:"manage/product/addProduct.do",
                /*onSubmit: function(){
                    return $(this).form('enableValidation').form('validate')
                    // do some check
                    // return false to prevent submit;
                },*/
				onSubmit : function(param) {
					if ($(this).form('validate')) {
						var productType = $('#productType option:selected').val();
						if ($(this).form('validate')) {
							if (productType == -1) {
								alert("请选择产品类型！")
								return false;
							}
						}
						return $(this).form('enableValidation').form('validate')
					}
				},
                success:function(data){
                    //console.info("data1===="+data);  //这里的data 是map 集合的json字符串，键是success的字符串形式
                    $.each(JSON.parse(data), function(index, value){   //JSON字符串转换为JavaScript对象
                        console.info( "Item #" + index + ": " + value );
                        if(value){
                            //alert(data.success);
                            $(".panel-tool-close").click();  //对话框的右上角的关闭按钮默认的class 是panel-tool-close
                            loadSingle();
                        }else{
                            alert("添加失败");
                        }
                    });
                },
                dataType:"text"
            });
       }
       
       //重置表单
        function clearForm() {
            $("#ff").form('clear');
        }

        //自定义表单验证
        $.extend($.fn.validatebox.defaults.rules, {
            //下拉选项框 必选
            selectRequired: {
                validator: function (value) {
                   /* if (value == "" || value.indexOf('请选择') >= 0 || value.indexOf('全部') >= 0) {
                        return false;
                    }*/
                    if (value == "" || value == "-1" ) {
                        return false;
                    }
                    else {
                        return true;
                    }
                },
                message: '该下拉框为必选项'
            },
            // 验证数字
            isNumber : {
                validator : function(value) {
                    return /^[0-9]+$/.test(value);
                },
                message : "只能输入数字"
            }

        });

        function loadSingle(){
			//用datagrid分页展示产品信息
			$('#dg').datagrid({
				url:'manage/product/listSingleProduct.do',
				resizable:true,
				toolbar:"#tb",//设置工具条
				striped:true,//将行的展示条纹化
				//nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
				loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
				pagination:true,//设置显示分页工具条
				rownumbers:true,//设置是否显示行号
				singleSelect:false,//设置是否只能选中一行
				selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里
				checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项
				pageNumber:1,//设置起始页码
				pageSize:15,//设置每页展示的条数
				pageList:[15,30,45],//设置每页展示展示的条数的下拉列表
				columns:[[
					{field:'ck',checkbox:'true'},
					{field:'productName',title:'产品名称'},
					{field:'productId',title:'产品编码'},
					{field:'productType',title:'产品类别'},
					{field:'standardPrice',title:'标准价格'},
					{field:'description',title:'产品描述'},
					{field:'creatorUserId',title:'创建人'},
					{field:'updateTime',title:'更新时间'},
					{field:'createTime',title:'创建时间'},
					{field:'leaderId',title:'负责人'},
					{field:'productState',title:'是否下架'}
					/*{field:'  ',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateStudent(\""+row.stuNo+"\");'>修改</a>&emsp;"+
                                "<a href='javascript:deleteStudent(\""+row.stuNo+"\");'>删除</a>&emsp;"
                        }
                    }*/
				]]
			});
		}


	</script>
</body>
</html>
				
