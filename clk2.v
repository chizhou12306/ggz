//********************ѧУ��ɽ���Ƽ���ѧ*****************************//
//********************רҵ��������Ϣ��ѧ�뼼��***********************//
//********************������������***********************************//
//********************ָ����ʦ����С��*******************************//
//********************��Ŀ��CNN�㷨��FPGA������ʵ��******************//
//********************���ڣ�2019.06.01*******************************//
//********************δ��������ֹת��*****************************//

module clk2(
	clk,
	rst,
	out_convl1,
	
	in_pool1_1,
	in_pool1_2
);

input clk;
input rst;
input [447:0] out_convl1; //��һ�������������һ�δ�����һ��ͼ�񣬹�����ͼ��
 
output reg [447:0] in_pool1_1; //��һ����������ͼ��1
output reg [447:0] in_pool1_2; ////��һ����������ͼ��2

integer count;

always @(posedge clk)
begin
	if(rst) count = 0;

	else begin
		if(out_convl1>=0) begin
			if(count==2) begin
				in_pool1_1 = out_convl1;
				count = 3;
				//$display("in_pool1_1 = %h", in_pool1_1);
			end
			
			else if(count==14) begin
				in_pool1_2 = out_convl1;
				count = 15;
				//$display("in_pool1_2 = %h", in_pool1_2);
			end
			
			else begin
				count = count + 1;
				if(count==26) begin
					count = 0;
				end
			end
		end
	end
end

endmodule