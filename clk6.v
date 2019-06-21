//********************ѧУ��ɽ���Ƽ���ѧ*****************************//
//********************רҵ��������Ϣ��ѧ�뼼��***********************//
//********************������������***********************************//
//********************ָ����ʦ����С��*******************************//
//********************��Ŀ��CNN�㷨��FPGA������ʵ��******************//
//********************���ڣ�2019.06.01*******************************//
//********************δ��������ֹת��*****************************//

module clk6(
	clk,
	rst,
	out_FCL1_1,
	out_FCL1_2,
	out_FCL1_3,
	out_FCL1_4,
	out_FCL1_5,
	out_FCL1_6,
	out_FCL1_7,
	out_FCL1_8,
	out_FCL1_9,
	out_FCL1_10,
	out_FCL1_11,
	out_FCL1_12,
	out_FCL1_13,
	out_FCL1_14,
	out_FCL1_15,
	out_FCL1_16,
	
	in_FCL2_1,
	in_FCL2_2,
	in_FCL2_3,
	in_FCL2_4,
	in_FCL2_5,
	in_FCL2_6,
	in_FCL2_7,
	in_FCL2_8,
	in_FCL2_9,
	in_FCL2_10,
	in_FCL2_11,
	in_FCL2_12,
	in_FCL2_13,
	in_FCL2_14,
	in_FCL2_15,
	in_FCL2_16
);

input clk;
input rst;

//��һ��ȫ���Ӳ��16�����
input [15:0] out_FCL1_1;
input [15:0] out_FCL1_2;
input [15:0] out_FCL1_3;
input [15:0] out_FCL1_4;
input [15:0] out_FCL1_5;
input [15:0] out_FCL1_6;
input [15:0] out_FCL1_7;
input [15:0] out_FCL1_8;
input [15:0] out_FCL1_9;
input [15:0] out_FCL1_10;
input [15:0] out_FCL1_11;
input [15:0] out_FCL1_12;
input [15:0] out_FCL1_13;
input [15:0] out_FCL1_14;
input [15:0] out_FCL1_15;
input [15:0] out_FCL1_16;

//���ڵڶ���ȫ���Ӳ������
output reg [15:0] in_FCL2_1;
output reg [15:0] in_FCL2_2;
output reg [15:0] in_FCL2_3;
output reg [15:0] in_FCL2_4;
output reg [15:0] in_FCL2_5;
output reg [15:0] in_FCL2_6;
output reg [15:0] in_FCL2_7;
output reg [15:0] in_FCL2_8;
output reg [15:0] in_FCL2_9;
output reg [15:0] in_FCL2_10;
output reg [15:0] in_FCL2_11;
output reg [15:0] in_FCL2_12;
output reg [15:0] in_FCL2_13;
output reg [15:0] in_FCL2_14;
output reg [15:0] in_FCL2_15;
output reg [15:0] in_FCL2_16;

//��������������ͼƬ������
integer line;
integer count;

always @(posedge clk)
begin
	if(rst) begin
		count = 16;
		line  = 6;
	end
	
	else begin
		if(out_FCL1_1>=0) begin
			if(line==30) begin
				if(count==25) begin
					in_FCL2_1 = out_FCL1_1;
					in_FCL2_2 = out_FCL1_2;
					in_FCL2_3 = out_FCL1_3;
					in_FCL2_4 = out_FCL1_4;
					in_FCL2_5 = out_FCL1_5;
					in_FCL2_6 = out_FCL1_6;
					in_FCL2_7 = out_FCL1_7;
					in_FCL2_8 = out_FCL1_8;
					in_FCL2_9 = out_FCL1_9;
					in_FCL2_10 = out_FCL1_10;
					in_FCL2_11 = out_FCL1_11;
					in_FCL2_12 = out_FCL1_12;
					in_FCL2_13 = out_FCL1_13;
					in_FCL2_14 = out_FCL1_14;
					in_FCL2_15 = out_FCL1_15;
					in_FCL2_16 = out_FCL1_16;
					//$display("in_FCL2_16 = %h", in_FCL2_16);
					count = 0;
					line = 1;
				end
				
				else begin
					count = count + 1;
				end
			end
			
			else begin
				count = count + 1;
				if(count>25) begin
					count = 0;
					line = line + 1;
				end
			end
		end
	end
end


endmodule