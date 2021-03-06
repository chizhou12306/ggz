//********************学校：山东科技大学*****************************//
//********************专业：电子信息科学与技术***********************//
//********************姓名：巩光众***********************************//
//********************指导教师：张小军*******************************//
//********************题目：CNN算法的FPGA加速器实现******************//
//********************日期：2019.06.01*******************************//
//********************未经允许，禁止转载*****************************//


module clk1(
	clk,
	rst,

	in_pic,
	pic_data
);

input clk;
input rst;
input [223:0] in_pic; //从ROM中取出一行数据
output reg [223:0] pic_data; //输出一行数据到第一个卷积层

integer count; //时钟同步使用

always @(posedge clk)
begin
	if(rst) count = 0;
	
	else begin
		if(count==0) begin
			pic_data = in_pic;
			count = 1;
			//$display("pic_data = %h", pic_data);
		end
		
		else begin
			count = count + 1;
			if(count==26) count = 0; //26个周期处理一幅图片
		end
	end
end

endmodule