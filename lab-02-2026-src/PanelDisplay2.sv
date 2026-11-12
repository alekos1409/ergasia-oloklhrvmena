module PanelDisplay2 (
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
logic  [9:0]horizontal_count;
 always_ff @(posedge clk) begin
    if (rst)begin
	hsync <= 1;
	vsync <= 1;
	red <= 0;
	green <= 0;
	blue <= 0;
	horizontal_count <= 0;
	vertical_count <= 0;
    end
    else if (pxlClk) begin
         if(horizontal_count == 1039)begin
        horizontal_count <= 0;
        hsync <= 1;
            if(vertical_count == 665)begin
            vertical_count <= 0;
            hsync <= 1;
            end
            else vertical_count <= vertical_count + 1;
        end
        else if(horizontal_count > 855 && horizontal_count <= 975)begin
            hsync <= 0;
            horizontal_count <= horizontal_count + 1;
        end
            else begin
                hsync <= 1;
                horizontal_count <= horizontal_count + 1;
            end
        if(vertical_count >= 637 && vertical_count <= 642)
        vsync <=0;
        else 
        vsync <=1;
        if(horizontal_count <= 399 && vertical_count <= 299)begin
            red <= 4'b1111;
            green <= 4'b0000;
            blue <= 4'b0000;
        end
        else if(horizontal_count > 399 && horizontal_count <= 799 && vertical_count <= 299)begin
            red <= 4'b0000;
            green <= 4'b1111;
            blue <= 4'b0000;
        end
        else if(horizontal_count <= 399 && vertical_count > 299 && vertical_count <= 599)begin
            red <= 4'b0000;
            green <= 4'b0000;
            blue <= 4'b1111;
        end
          else if(horizontal_count > 399 && horizontal_count <= 799 && vertical_count > 299 && vertical_count <= 599)begin
            red <= 4'b1111;
            green <= 4'b1111;
            blue <= 4'b1111;
        end
        else begin
             red <= 4'b0000;
            green <= 4'b0000;
            blue <= 4'b0000;
    end
end
end
endmodule