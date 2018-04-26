dim conn
dim db
db="F:\Hbuilder\web\start_01\baidu/acc_pwd.mdb" //你的文件路径下面的数据库，具体你自己替换
set conn=Server.CreateObject("adodb.connection")
conn.provider="Microsoft.jet.oledb.4.0;Data source=" & Server.MapPath(db)
conn.open

sub CloseConn()
conn.close
set conn=nothing
end sub

dim rs,sql
set rs=server.CreateObject("adodb.recordset")
sql="select * from wo where 表格里面的字段='"&indexAD_ID&"' "//我是你的数据库里德表格名称 自己在数据库里面建好
rs.open sql,conn,1,1
