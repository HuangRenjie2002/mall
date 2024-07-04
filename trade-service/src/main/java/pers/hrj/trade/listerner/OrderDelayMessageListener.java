package pers.hrj.trade.listerner;

import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;
import pers.hrj.api.client.PayClient;
import pers.hrj.api.dto.PayOrderDTO;
import pers.hrj.trade.constants.MqConstants;
import pers.hrj.trade.domain.po.Order;
import pers.hrj.trade.service.IOrderService;

@Component
@RequiredArgsConstructor
public class OrderDelayMessageListener {

    private final IOrderService orderService;
    private final PayClient payClient;

    @RabbitListener(bindings = @QueueBinding(
            value = @Queue(name = MqConstants.DELAY_ORDER_QUEUE_NAME),
            exchange = @Exchange(name = MqConstants.DELAY_EXCHANGE_NAME, delayed = "true"),
            key = MqConstants.DELAY_ORDER_KEY
    ))
    public void listenOrderDelayMessage(Long orderId) {
        Order order = orderService.getById(orderId);
        if (order == null || order.getStatus() != 1) {
            return;
        }
        PayOrderDTO payOrder = payClient.queryPayOrderByBizOrderNo(orderId);
        if (payOrder != null && payOrder.getStatus() == 3) {
            orderService.markOrderPaySuccess(orderId);
        } else {
            orderService.cancelOrder(orderId);
        }
    }
}
