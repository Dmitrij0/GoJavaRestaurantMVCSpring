package com.goit.dlenchuk.restaurant;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.beans.PropertyVetoException;
import java.util.Properties;

@Configuration
@ComponentScan("com.goit.dlenchuk.restaurant")
@EnableTransactionManagement
@PropertySource("classpath:jdbc.properties")
public class RestaurantApplicationContext {

    @Value("${javax.persistence.jdbc.driver}")
    private String driverClass;
    @Value("${javax.persistence.jdbc.url}")
    private String jdbcUrl;
    @Value("${javax.persistence.jdbc.user}")
    private String user;
    @Value("${javax.persistence.jdbc.password}")
    private String password;

    @Bean
    public ComboPooledDataSource comboPooledDataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass(driverClass);
        dataSource.setJdbcUrl(jdbcUrl);
        dataSource.setUser(user);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() throws PropertyVetoException {
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(comboPooledDataSource());
        localSessionFactoryBean.setPackagesToScan("com.goit.dlenchuk.restaurant");
        Properties hibernateProperties = new Properties();
        hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hibernateProperties.put("hibernate.format_sql", "true");
        hibernateProperties.put("hibernate.show_sql", "true");
//        hibernateProperties.put("hibernate.enable_lazy_load_no_trans", "true");
        localSessionFactoryBean.setHibernateProperties(hibernateProperties);
        return localSessionFactoryBean;
    }

    @Bean
    public HibernateTransactionManager txManager() throws PropertyVetoException {
        return new HibernateTransactionManager(sessionFactory().getObject());
    }

}
