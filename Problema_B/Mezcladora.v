/* 
 * Autor: Sergio Garino Vargas
 * Carné: B73157
 * Fecha de entrega: 9/12/2022
 */

module Mezcladora (
    input Clk, Reset,
    input IN, TOK, P1, P2,
    output V1, V2, V3, M, T, S, B);

/*
 * Defino dos vectores, uno de estado presente y otro para el próximo estado
 * los cuales son de tamaño tres por que el diseño de la ASM se tiene 5 
 * estados posibles que son requesentables con 3 bits.
 */
reg [2:0] EstPres, ProxEst;     

/*
 * Hago la asignación de estados
 */
parameter a = 3'b000;
parameter b = 3'b001;
parameter c = 3'b010;
parameter d = 3'b011;
parameter e = 3'b100;

/*
 * Memoria de estados
 */
always @(posedge Clk, posedge Reset) 
    if (Reset) EstPres <= a;
    else       EstPres <= ProxEst;

/*
* Lógica de cálculo de próximo estado
*/
always @(*)
    case (EstPres)
        a:  if (IN) ProxEst = b;
            else    ProxEst = a;

        b:  if (P1) ProxEst = c;
            else    ProxEst = b;

        c:  if (TOK) ProxEst = d;
            else     ProxEst = c;

        d:  if (TOK) ProxEst = e;
            else     ProxEst = d;

        e:  case ({P1, P2})
                2'b00: ProxEst = a; // P1= 0, P2 = 0
                2'b01: ProxEst = e; // P1= 0, P2 = 1
                2'b10: ProxEst = e; // P1= 1, P2 = 0
                2'b11: ProxEst = e; // P1= 1, P2 = 1
            endcase
    endcase   

/*
 * Lógica de cálculo de salidas
 */
assign V1 = (EstPres == b) ;
assign V2 = (EstPres == b) | (EstPres == c);
assign V3 = (EstPres == c & TOK & ~Clk) | (EstPres == d);
assign M = (EstPres == c) | (EstPres == d);
assign T = (EstPres == d);
assign T = ~(EstPres == c);
assign S = (EstPres == c) | (EstPres == d);
assign B = (EstPres == e & P1) | (EstPres == e & !P1 & P2);

endmodule