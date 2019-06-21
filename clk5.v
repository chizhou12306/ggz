//********************ѧУ��ɽ���Ƽ���ѧ*****************************//
//********************רҵ��������Ϣ��ѧ�뼼��***********************//
//********************������������***********************************//
//********************ָ����ʦ����С��*******************************//
//********************��Ŀ��CNN�㷨��FPGA������ʵ��******************//
//********************���ڣ�2019.06.01*******************************//
//********************δ��������ֹת��*****************************//

module clk5(
	clk,
	rst,
	out_pool2_1,
	out_pool2_2,
	out_pool2_3,
	out_pool2_4,

	in_FCL1_1,
	in_FCL1_2,
	in_FCL1_3,
	in_FCL1_4
);

input clk;
input rst;
input [111:0] out_pool2_1;
input [111:0] out_pool2_2;
input [111:0] out_pool2_3;
input [111:0] out_pool2_4;

output reg [111:0] in_FCL1_1;
output reg [111:0] in_FCL1_2;
output reg [111:0] in_FCL1_3;
output reg [111:0] in_FCL1_4;

integer count;

always @(posedge clk)
begin
	if(rst) count = 16;

	else begin
		if(out_pool2_1>=0) begin
			if(count==16) begin
				in_FCL1_1 = out_pool2_1;
				count = 17;
			end
			
			else if(count==19) begin
				in_FCL1_2 = out_pool2_2;
				//$display("in_FCL1_2 = %h", in_FCL1_2);
				count = 20;
			end
			
			else if(count==22) begin
				in_FCL1_3 = out_pool2_3;
				count = 23;
			end
			
			else if(count==25) begin
				in_FCL1_4 = out_pool2_4;
				//$display("in_FCL1_4 = %h", in_FCL1_4);
				count = 0;
			end
			
			else begin
				count = count + 1;
			end
		end
	end
end

endmodule