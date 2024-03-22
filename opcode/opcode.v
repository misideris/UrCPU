module opcode;

  parameter full_word = 20; 
  parameter MEM = 1024;

  reg [full_word-1:0] memory [0:MEM-1];

  reg [full_word-1:0] counter; 
  reg [full_word-1:0] instruction;
  reg [full_word-1:0] increment;
  reg [full_word-1:0] general_reg; 

  reg clk = 0;

  initial begin

    memory[0] = 20'b00001000100000000000;
    memory[1] = 20'b00010000100000000000; 
    memory[2] = 20'b00011000100000000000; 
    memory[3] = 20'b00000000000000000000; 

    memory[10] = 20'b00001000100000000000; 
    memory[11] = 20'b00010000100000000000;
    memory[12] = 20'b00011000100000000000; 
    memory[13] = 20'b01001000000101010000; 
    memory[14] = 20'b00000000000000000000; 
    memory[15] = 20'b00000000000000000000; 
    memory[16] = 20'b00000000000000000000; 
    memory[17] = 20'b00000000000000000000; 
    memory[18] = 20'b00000000000000000000; 
    memory[19] = 20'b00000000000000000000; 

    counter = 0; 
    forever #10 clk = ~clk;
  end

  initial begin
    $display("Starting no JMP: ");
    JMP;

    $display("Starting JMP: ");
    NO_JMP;

    $finish;
  end

// Without Jumps

  task JMP;
      repeat (4) begin 
      instruction = memory[counter];
      counter = counter + 1;
      case(instruction)
        20'b00000000000000000000: $display("NOP"); 
        20'b00001000100000000000: increment = increment + general_reg; 
        20'b00010000100000000000: increment = increment - general_reg; 
        20'b00011000100000000000: increment = increment & general_reg;
      endcase
      $display("Clock Cycle %0d: instruction=%b, counter=%d, increment=%d, general_reg=%d", $time, instruction, counter, increment, general_reg);
      #10;
    end
  end

  // With Jumps 
  task NO_JMP;
    repeat (20) begin 
      instruction = memory[counter];
      counter = counter + 1;
      case(instruction)
        20'b00000000000000000000: $display("NOP"); 
        20'b00001000100000000000: increment = increment + general_reg; 
        20'b00010000100000000000: increment = increment - general_reg; 
        20'b00011000100000000000: increment = increment & general_reg; 
        20'b01001000000101010000: counter = 21;
      endcase
      $display("Clock Cycle %0d: instruction=%b, counter=%d, increment=%d, general_reg=%d", $time, instruction, counter, increment, general_reg);
      #10;
    end
  end

endmodule
