package pers.hrj.api.client.fallback;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FallbackFactory;
import pers.hrj.api.client.ItemClient;
import pers.hrj.api.dto.ItemDTO;
import pers.hrj.api.dto.OrderDetailDTO;

import java.util.Collection;
import java.util.List;

@Slf4j
public class ItemClientFallbackFactory implements FallbackFactory<ItemClient> {
    @Override
    public ItemClient create(Throwable cause) {
        return new ItemClient() {
            @Override
            public List<ItemDTO> queryItemByIds(Collection<Long> ids) {
                log.error("查询商品失败",cause);
                return List.of();
            }

            @Override
            public void deductStock(List<OrderDetailDTO> items) {
                log.error("扣减商品库存失败",cause);
                throw new RuntimeException(cause);
            }
        };
    }
}