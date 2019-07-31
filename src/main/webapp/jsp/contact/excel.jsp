<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/30
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
<script>
    //导出excel
    window.excelExport=function(){
        var checkStatus = table.checkStatus('YD-order-orderManage-list')
            , checkData = checkStatus.data //得到选中的数据
            , ids = [];
        if (checkData.length === 0) {
            return layer.msg('请选择数据');
        } else {
            for (var i in checkData) {
                ids.push(checkData[i].id);
            }
        }
        layer.confirm('确定导出吗？', function (index) {
            //执行 Ajax 后重载
            admin.req({
                type: 'post',
                url: '${ctx}/order/orderManage/excelExport',
                data: {
                    'ids': ids
                },
                done: function (res) {
                    // 登入成功的提示与跳转
                    if (res.code === 0) {
                        table.reload('YD-order-orderManage-list');
                        window.open(res.data)
                        layer.msg('已导出');
                    } else {
                        layer.msg(res.msg);
                    }
                }
            });
        });

    }

    //导入excel
    window.excelEntrance=function(){
        var index = layer.open({
            type: 1
            ,title: '导入excel'
            ,content: '<form id="uploadForm" enctype="multipart/form-data"><div style="width: 200px; padding: 30px;"><input type="file" name="file" value="上传excel"/></div></form>'
            ,area: ['300px', '200px']
            ,maxmin: false
            ,btn: ['确定', '取消']
            ,yes: function(index, layero){
                var formData=new FormData($("#uploadForm")[0]);
                $.ajax({
                    type : "POST",
                    url : '${ctx}/order/orderManage/excelEntrance',
                    data : formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success : function(res) {
                        if(res.code==0){
                            layer.msg('操作成功！');
                            //点击确认触发 iframe 内容中的按钮提交
                            layer.close(index)
                        }else {
                            layer.msg(res.msg);
                        }
                    }
                });
            }
        });
    }
</script>
</html>
