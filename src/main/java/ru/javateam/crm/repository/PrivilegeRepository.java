package ru.javateam.crm.repository;

import ru.javateam.crm.domain.model.Privilege;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrivilegeRepository extends JpaRepository<Privilege, Long> {

}
