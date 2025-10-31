CREATE TABLE cuentas (
 numero_cuenta VARCHAR(10) PRIMARY KEY,
 saldo DECIMAL(10,2)
 );
 
 INSERT INTO cuentas(numero_cuenta,saldo) VALUES
 ('A',1000.00),
 ('B',750.00),
 ('C',1200.00),
 ('D',500.00),
 ('E',2000.00);
 select*from cuentas;
 BEGIN;  

UPDATE cuentas
SET saldo = saldo - 100
WHERE numero_cuenta = 'A';


UPDATE cuentas
SET saldo = saldo + 100
WHERE numero_cuenta = 'B';

COMMIT; 

 
 