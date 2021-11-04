package com.sist.configuration;

import lombok.RequiredArgsConstructor;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.persistence.*;

@Configuration
@RequiredArgsConstructor
public class HibernateConfig {

    /*private final BasicDataSource dataSource;

    @Bean
    public EntityManagerFactory entityManagerFactory() {
        return Persistence.createEntityManagerFactory("jpa");
    }

    @Bean
    public EntityManager entityManager() {
        return entityManagerFactory().createEntityManager();
    }

    @Bean
    public EntityTransaction entityTransaction() {
        return entityManager().getTransaction();
    }*/
}
