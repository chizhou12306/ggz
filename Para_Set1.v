//********************ѧУ��ɽ���Ƽ���ѧ*****************************//
//********************רҵ��������Ϣ��ѧ�뼼��***********************//
//********************������������***********************************//
//********************ָ����ʦ����С��*******************************//
//********************��Ŀ��CNN�㷨��FPGA������ʵ��******************//
//********************���ڣ�2019.06.01*******************************//
//********************δ��������ֹת��*****************************//

module Para_Set1(
	clk,
	rst,
	pic_data,
	
	filt1,
	bias1
);

input clk;
input rst;
input [223:0] pic_data;
output reg [47:0] filt1;
output reg [15:0] bias1;

��һ������Ϊ2�����Թ���������ˣ�����ƫ����
reg [143:0] filt1_1; 
reg [143:0] filt1_2;
reg [15:0]  bias1_1;
reg [15:0]  bias1_2;

integer count;

always @(posedge clk)
begin
	if(rst) begin
		count = 0;
		
		filt1_1[15:0] = 16'h41;
		filt1_1[31:16] = 16'h39;
		filt1_1[47:32] = 16'h40;
		filt1_1[63:48] = 16'h38;
		filt1_1[79:64] = 16'h43;
		filt1_1[95:80] = 16'h40;
		filt1_1[111:96] = 16'h41;
		filt1_1[127:112] = 16'h41;
		filt1_1[143:128] = 16'h35;
		
		filt1_2[15:0] = 16'h37;
		filt1_2[31:16] = 16'h39;
		filt1_2[47:32] = 16'h42;
		filt1_2[63:48] = 16'h40;
		filt1_2[79:64] = 16'h43;
		filt1_2[95:80] = 16'h42;
		filt1_2[111:96] = 16'h39;
		filt1_2[127:112] = 16'h41;
		filt1_2[143:128] = 16'h38;
		
		bias1_1 = 16'h36;
		bias1_2 = 16'h36;
	end
	
	else begin
		if(pic_data>=0) begin
			if(count==0) begin
				filt1 = filt1_1[47:0]; //һ��ֻ�������������һ�У�ʵ�ָ���
				bias1 = bias1_1;
				count = 1;
			end
			
			else if(count==1) begin
				filt1 = filt1_1[95:48];
				bias1 = bias1_1;
				count = 2;
			end
			
			else if(count==2) begin
				filt1 = filt1_1[143:96];
				bias1 = bias1_1;
				count = 3;
			end
			
			else if(count==12) begin
				filt1 = filt1_2[47:0];
				bias1 = bias1_2;
				count = 13;
			end
			
			else if(count==13) begin
				filt1 = filt1_2[95:48];
				bias1 = bias1_2;
				count = 14;
			end
			
			else if(count==14) begin
				filt1 = filt1_2[143:96];
				bias1 = bias1_2;
				count = 15;
			end
					
			else begin
				count = count + 1;
				if(count==26) count = 0;
			end
		end
	end
end



endmodule