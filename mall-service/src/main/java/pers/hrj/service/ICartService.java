package pers.hrj.service;

import com.baomidou.mybatisplus.extension.service.IService;
import pers.hrj.domain.dto.CartFormDTO;
import pers.hrj.domain.po.Cart;
import pers.hrj.domain.vo.CartVO;

import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 订单详情表 服务类
 * </p>
 *
 * @author 虎哥
 * @since 2023-05-05
 */
public interface ICartService extends IService<Cart> {

    void addItem2Cart(CartFormDTO cartFormDTO);

    List<CartVO> queryMyCarts();

    void removeByItemIds(Collection<Long> itemIds);
}
