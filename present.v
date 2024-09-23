module present_cipher(
    input [63:0] plaintext,
    input [79:0] key,
    output [63:0] ciphertext
);

    reg [63:0] state;
    reg [79:0] key_state;
    integer i;

    // S-Box for PRESENT
    function [3:0] sbox(input [3:0] in);
        case (in)
            4'h0: sbox = 4'hC;
            4'h1: sbox = 4'h5;
            4'h2: sbox = 4'h6;
            4'h3: sbox = 4'hB;
            4'h4: sbox = 4'h9;
            4'h5: sbox = 4'h0;
            4'h6: sbox = 4'hA;
            4'h7: sbox = 4'hD;
            4'h8: sbox = 4'h3;
            4'h9: sbox = 4'hE;
            4'hA: sbox = 4'hF;
            4'hB: sbox = 4'h8;
            4'hC: sbox = 4'h4;
            4'hD: sbox = 4'h7;
            4'hE: sbox = 4'h1;
            4'hF: sbox = 4'h2;
        endcase
    endfunction

    // Permutation for PRESENT
    function [63:0] perm(input [63:0] in);
        integer j;
        reg [63:0] out;
        for (j = 0; j < 64; j = j + 1) begin
            out[j] = in[(j * 16) % 63]; 
        end
        perm = out;
    endfunction

    // Round key update function
    function [79:0] key_update(input [79:0] in_key);
        key_update = {in_key[18:0], in_key[79:19]};
        key_update[79:76] = sbox(in_key[79:76]);
        key_update[19:15] = in_key[19:15] ^ 5'b00001; 
    endfunction

    always @(plaintext, key) begin
        state = plaintext;
        key_state = key;

        for (i = 0; i < 31; i = i + 1) begin
            state = state ^ key_state[79:16]; // XOR with round key
            state = perm(state);              // Apply permutation
            key_state = key_update(key_state); // Update key
        end
    end

    assign ciphertext = state;
endmodule
