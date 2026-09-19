`default_nettype none

module glyphs_rom(
    input  wire [5:0] c, input  wire [3:0] y, input  wire [2:0] x, output reg pixel
);
    reg [7:0] rb;

    always @(*) begin
        case (c)
            0:  case(y) 2,10:rb=8'h7E; 3,9:rb=8'hC3; 4,5,6,7,8:rb=8'hC0; default:rb=0; endcase // C
            1:  case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            2:  case(y) 2,3,4,5,6,7,8,9:rb=8'hC0; 10:rb=8'hFE; default:rb=0; endcase // L
            3:  case(y) 2,6,10:rb=8'hFE; 3,4,5,7,8,9:rb=8'hC0; default:rb=0; endcase // E
            4:  case(y) 2,10:rb=8'h7E; 3,4,5:rb=8'hC0; 6:rb=8'hCE; 7,8,9:rb=8'hC6; default:rb=0; endcase // G
            5:  case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            6:  case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            7:  rb = 8'h00; // SPACE
            8:  case(y) 2,10:rb=8'hF8; 3,4,5,6,7,8,9:rb=8'hC6; default:rb=0; endcase // D
            9:  case(y) 2,6,10:rb=8'hFE; 3,4,5,7,8,9:rb=8'hC0; default:rb=0; endcase // E
            10: rb = 8'h00; // SPACE
            11: case(y) 2:rb=8'hC3; 3:rb=8'hE7; 4:rb=8'hFF; 5:rb=8'hDB; 6,7,8,9,10:rb=8'hC3; default:rb=0; endcase // M
            12: case(y) 2,3,4,5,6,7,8,9:rb=8'hC6; 10:rb=8'h7E; default:rb=0; endcase // U
            13: case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            14: case(y) 2:rb=8'hFF; 3,4,5,6,7,8,9,10:rb=8'h18; default:rb=0; endcase // T
            15: case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            16: case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            17: case(y) 2,3,4,5,6,7,8,9:rb=8'hC0; 10:rb=8'hFE; default:rb=0; endcase // L
            18: case(y) 2,3,4,5,6,7,8,9:rb=8'hC6; 10:rb=8'h7E; default:rb=0; endcase // U
            19: case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9,10:rb=8'hC0; default:rb=0; endcase // P
            20: case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // A
            default: rb = 8'h00;
        endcase
        pixel = rb[7-x];
    end
endmodule