module gift_cipher(
    input [63:0] plaintext,
    input [127:0] key,
    output [63:0] ciphertext
);

    reg [63:0] state;
    reg [127:0] key_state;
    integer i;

    // GIFT S-Box
    function [3:0] gift_sbox(input [3:0] in);
        case (in)
            4'h0: gift_sbox = 4'h1;
            4'h1: gift_sbox = 4'hA;
            4'h2: gift_sbox = 4'h4;
            4'h3: gift_sbox = 4'hC;
            4'h4: gift_sbox = 4'h6;
            4'h5: gift_sbox = 4'hF;
            4'h6: gift_sbox = 4'h3;
            4'h7: gift_sbox = 4'h9;
            4'h8: gift_sbox = 4'h2;
            4'h9: gift_sbox = 4'hD;
            4'hA: gift_sbox = 4'hB;
            4'hB: gift_sbox = 4'h7;
            4'hC: gift_sbox = 4'h5;
            4'hD: gift_sbox = 4'h0;
            4'hE: gift_sbox = 4'h8;
            4'hF: gift_sbox = 4'hE;
        endcase
    endfunction

    // GIFT Permutation
    function [63:0] gift_perm(input [63:0] in);
        integer j;
        reg [63:0] out;
        for (j = 0; j < 64; j = j + 1) begin
            out[j] = in[(j * 2) % 63]; 
        end
        gift_perm = out;
    endfunction

    // Round key update function for GIFT
    function [127:0] key_update(input [127:0] in_key);
        key_update = {in_key[31:0], in_key[127:32]}; // Rotate key
        key_update[63:60] = gift_sbox(in_key[127:124]); // Update using S-box
    endfunction

    always @(plaintext, key) begin
        state = plaintext;
        key_state = key;

        for (i = 0; i < 40; i = i + 1) begin
            state = state ^ key_state[127:64];  // XOR with round key
            state = gift_perm(state);           // Apply permutation
            key_state = key_update(key_state);  // Update key
        end
    end

    assign ciphertext = state;
endmodule
