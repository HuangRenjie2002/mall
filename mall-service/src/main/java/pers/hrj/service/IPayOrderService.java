package pers.hrj.service;

import pers.hrj.domain.dto.PayApplyDTO;
import pers.hrj.domain.dto.PayOrderFormDTO;
import pers.hrj.domain.po.PayOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 支付订单 服务类
 * </p>
 *
 * @author 虎哥
 * @since 2023-05-16
 */
public interface IPayOrderService extends IService<PayOrder> {

    String applyPayOrder(PayApplyDTO applyDTO);

    void tryPayOrderByBalance(PayOrderFormDTO payOrderFormDTO);
}
