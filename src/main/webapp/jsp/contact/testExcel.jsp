<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/31
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../../static/easyui/jquery.min.js"></script>
</head>
<body>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title title">导入</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-lg-12">
                <form id="defaultForm" method="" class="form-horizontal recoveryNodeForm" action="">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">导入文件</label>
                            <div class="col-lg-6">
                                <input type="file" class="form-control" style="height:36px;" name="uploadFile" id="uploadFile"/>
                            </div>
                            <button type="button" class="btn btn-primary" id="uploadExcel">上传</button>
                        </div>
                    </div>
                    <input type="hidden" name="pkId" value="" />
                </form>
            </div>
        </div>
        <div>
            <span><b>导入结果反馈</b></span>
            <ul id="exportResult">

            </ul>
        </div>
    </div>
</div>
</body>
<script>
    uploadExcel : function () {
        $("#uploadExcel").on("click","",function () {
            $(".recoveryNodeForm").data("bootstrapValidator").validate();
            var flag = $(".recoveryNodeForm").data("bootstrapValidator").isValid();
            if(!flag){
                //未通过验证
                return false;
            }

            var fileObj = document.getElementById("uploadFile").files[0];
            var formFile = new FormData();
            formFile.append("file", fileObj);
            var data = formFile;
            $.ajax({
                url: ctx +'/recovery/netStorage/uploadFile.mvc',
                data: data,
                type: "Post",
                dataType: "json",
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (result) {
                    var htmlstr = '';
                    if(result.result==false){
                        for(var i=0;i<result.data.length;i++){
                            htmlstr += '<li>'+result.data[i]+'</li>';
                        }
                    } else {
                        htmlstr = '<li>上传成功</li>';
                    }

                    $('#exportResult').html(htmlstr);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown){
                    DialogUtil.error("系统错误");
                }
            });
        });
    }


    validatorForm :function () {
        $(".recoveryNodeForm").bootstrapValidator({
            message: 'This value is not valid',
            live: 'submitted',
            fields: {/*验证*/
                uploadFile: {
                    message: '导入文件无效',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '导入文件不能为空'
                        },
                        regexp: {
                            regexp: /.xlsx$/,
                            message: '导入文件类型必须是excel'
                        }
                    }
                }
            }
        });

    }

</script>
</html>
