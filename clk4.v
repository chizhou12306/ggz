//********************ѧУ��ɽ���Ƽ���ѧ*****************************//
//********************רҵ��������Ϣ��ѧ�뼼��***********************//
//********************������������***********************************//
//********************ָ����ʦ����С��*******************************//
//********************��Ŀ��CNN�㷨��FPGA������ʵ��******************//
//********************���ڣ�2019.06.01*******************************//
//********************δ��������ֹת��*****************************//

module clk4(
	clk,
	rst,
	out_convl2,

	in_pool2_1,
	in_pool2_2,
	in_pool2_3,
	in_pool2_4
);

input clk;
input rst;
input [223:0] out_convl2;

output reg [223:0] in_pool2_1;
output reg [223:0] in_pool2_2;
output reg [223:0] in_pool2_3;
output reg [223:0] in_pool2_4;

integer count;

always @(posedge clk)
begin
	if(rst) count = 16;

	else begin
		if(out_convl2>=0) begin
			if(count==16) begin
				in_pool2_1 = out_convl2;
				count = 17;
			end
			
			else if(count==19) begin
				in_pool2_2 = out_convl2;
				count = 20;
			end
			
			else if(count==22) begin
				in_pool2_3 = out_convl2;
				count = 23;
			end
			
			else if(count==25) begin
				in_pool2_4 = out_convl2;
				count = 0;
				/*$display("in_pool2_1 = %h", in_pool2_1);
				$display("in_pool2_2 = %h", in_pool2_2);
				$display("in_pool2_3 = %h", in_pool2_3);
				$display("in_pool2_4 = %h", in_pool2_4);*/
			end
			
			else begin
				count = count + 1;
			end
		end
	end
end

endmodule