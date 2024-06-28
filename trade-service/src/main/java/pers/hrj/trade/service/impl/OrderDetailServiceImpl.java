package pers.hrj.trade.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import pers.hrj.trade.domain.po.OrderDetail;
import pers.hrj.trade.mapper.OrderDetailMapper;
import pers.hrj.trade.service.IOrderDetailService;

/**
 * <p>
 * 订单详情表 服务实现类
 * </p>
 *
 * @author 虎哥
 * @since 2023-05-05
 */
@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements IOrderDetailService {

}
