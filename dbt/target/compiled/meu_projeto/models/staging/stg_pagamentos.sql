SELECT
  id_pagamento,
  id_pedido,
  data_pagamento,
  valor_pago,
  metodo_pagamento
FROM pagamentos
WHERE valor_pago > 0