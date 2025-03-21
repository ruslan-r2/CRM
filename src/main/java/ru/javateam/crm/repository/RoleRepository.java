package ru.javateam.crm.repository;

import ru.javateam.crm.domain.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {

}
