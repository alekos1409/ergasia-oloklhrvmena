module PanelDisplay (
	input logic clk,
	input logic rst,
	output logic hsync,
	output logic vsync,
	output logic [3:0] red,
	output logic [3:0] green,
	output logic [3:0] blue);
 logic pxlClk;
always_ff @(posedge clk) begin
 if (rst)
 pxlClk <= 1'b1;
 else
 pxlClk <= ~pxlClk;
end
logic  [9:0]vertical_count;
logic  [10:0]horizontal_count;
 always_ff @(posedge clk) begin
 if (rst)begin
	hsync <= 0;
	vsync <= 0;
	red <= 0;
	green <= 0;
	blue <= 0;
	horizontal_count <= 0;
	vertical_count <= 0;
 end
 else
 	if (pxlClk) begin
		if(vertical_count <= 299)begin
		vsync <= 1;
			if(horizontal_count <= 399)begin
		 	horizontal_count <= horizontal_count + 1;
		 	hsync <= 1;
			 red <= 4'b1111;
			 green <= 0;
			 blue <= 0;
			end
			else if(horizontal_count > 399 && horizontal_count <= 799)begin
			 horizontal_count <= horizontal_count + 1;
			 hsync <= 1;
			 green <= 4'b1111;
			 red <= 0;
			 blue <= 0;
			end
			else if(horizontal_count > 799 && horizontal_count <=855)begin
		 	horizontal_count <= horizontal_count + 1;
			 hsync <= 4'b1111;
			 green <= 0;
			 red <= 0;
			 blue <= 0;
			 end
			else if(horizontal_count > 855 && horizontal_count <= 975)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 0;
			end
			else if(horizontal_count > 975 && horizontal_count < 1039)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
			else if(horizontal_count == 1039)begin
			horizontal_count <= 0;
			vertical_count <= vertical_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
		end
		else if(vertical_count > 299 && vertical_count <= 599)begin
		vsync <= 1;
			if(horizontal_count <= 399)begin
		 	horizontal_count <= horizontal_count + 1;
		 	hsync <= 1;
			 blue <= 4'b1111;
			 green <= 0;
			red <= 0;
			end
			else if(horizontal_count > 399 && horizontal_count <= 799)begin
			 horizontal_count <= horizontal_count + 1;
			 hsync <= 4'b1111;
			 green <= 4'b1111;
			 red <= 4'b1111;
			 blue <= 4'b1111;
			end
			else if(horizontal_count > 799 && horizontal_count <=855)begin
		 	horizontal_count <= horizontal_count + 1;
			 hsync <= 1;
			 green <= 0;
			 red <= 0;
			 blue <= 0;
			 end
			else if(horizontal_count > 855 && horizontal_count <= 975)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 0;
			end
			else if(horizontal_count > 975 && horizontal_count < 1039)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
			else if(horizontal_count == 1039)begin
			horizontal_count <= 0;
			vertical_count <= vertical_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
		end
		else if(vertical_count > 599 && vertical_count <= 636)begin
			vsync <= 1;
			if(horizontal_count <= 399)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <=1;
			end
			else if(horizontal_count > 399 && horizontal_count <= 799)begin
			 horizontal_count <= horizontal_count + 1;
			 hsync <= 1;
			end
			else if(horizontal_count > 799 && horizontal_count <=855)begin
		 	horizontal_count <= horizontal_count + 1;
		 	hsync <= 1;
			end
			else if(horizontal_count > 855 && horizontal_count <= 975)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 0;
			end
			else if(horizontal_count > 975 && horizontal_count < 1039)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
			else if(horizontal_count == 1039)begin
			horizontal_count <= 0;
			vertical_count <= vertical_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
		end

		else if(vertical_count > 636 && vertical_count <= 642)begin
			vsync <= 0;
			if(horizontal_count <= 399)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <=1;
			end
			else if(horizontal_count > 399 && horizontal_count <= 799)begin
			 horizontal_count <= horizontal_count + 1;
			 hsync <= 1;
			end
			else if(horizontal_count > 799 && horizontal_count <=855)begin
		 	horizontal_count <= horizontal_count + 1;
		 	hsync <= 1;
			end
			else if(horizontal_count > 855 && horizontal_count <= 975)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 0;
			end
			else if(horizontal_count > 975 && horizontal_count < 1039)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
			else if(horizontal_count == 1039)begin
			horizontal_count <= 0;
			vertical_count <= vertical_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
		end
		else if(vertical_count > 642 && vertical_count < 665)begin
			vsync <= 1;
			if(horizontal_count <= 399)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <=1;
			end
			else if(horizontal_count > 399 && horizontal_count <= 799)begin
			 horizontal_count <= horizontal_count + 1;
			 hsync <= 1;
			end
			else if(horizontal_count > 799 && horizontal_count <=855)begin
		 	horizontal_count <= horizontal_count + 1;
		 	hsync <= 1;
			end
			else if(horizontal_count > 855 && horizontal_count <= 975)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 0;
			end
			else if(horizontal_count > 975 && horizontal_count < 1039)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
			else if(horizontal_count == 1039)begin
			horizontal_count <= 0;
			vertical_count <= vertical_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
		end
		else if(vertical_count == 665)begin
			vsync <= 1;
			if(horizontal_count <= 399)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <=1;
			end
			else if(horizontal_count > 399 && horizontal_count <= 799)begin
			 horizontal_count <= horizontal_count + 1;
			 hsync <= 1;
			end
			else if(horizontal_count > 799 && horizontal_count <=855)begin
		 	horizontal_count <= horizontal_count + 1;
		 	hsync <= 1;
			end
			else if(horizontal_count > 855 && horizontal_count <= 975)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 0;
			end
			else if(horizontal_count > 975 && horizontal_count < 1039)begin
		 	horizontal_count <= horizontal_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			end
			else if(horizontal_count == 1039)begin
			horizontal_count <= 0;
			vertical_count <= vertical_count + 1;
			hsync <= 1;
			green <= 0;
			red <= 0;
			blue <= 0;
			vertical_count <= 0;
			end
		
		end
	end
 end
endmodule