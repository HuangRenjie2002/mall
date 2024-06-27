package pers.hrj.service;

import com.baomidou.mybatisplus.extension.service.IService;
import pers.hrj.domain.dto.LoginFormDTO;
import pers.hrj.domain.po.User;
import pers.hrj.domain.vo.UserLoginVO;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author 虎哥
 * @since 2023-05-05
 */
public interface IUserService extends IService<User> {

    UserLoginVO login(LoginFormDTO loginFormDTO);

    void deductMoney(String pw, Integer totalFee);
}
