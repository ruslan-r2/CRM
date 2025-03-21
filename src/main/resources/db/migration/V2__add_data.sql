-- Пароль у всех 12345
INSERT INTO public.user_account(id, username, password, first_name, last_name, email, is_using2fa, enabled)
VALUES
    (1, 'admin', '$2a$10$EsazOVaVQiUuPwoICgpKvOV0Nupogdg/qRZtg7lgOfW3feV4YDlou', 'Руслан', 'Репин', 'admin@cms.ru', true, true),
    (2, 'manager', '$2a$10$3Z6DmdEF5bseyvOlrZ/Uc.hahZNT7EotPO9R.Aor6YR/ioRYI3q2u', 'Иван', 'Иванов', 'manager@cms.ru', true, true),
    (3, 'user', '$2a$10$3Z6DmdEF5bseyvOlrZ/Uc.hahZNT7EotPO9R.Aor6YR/ioRYI3q2u', 'Пётр', 'Петров', 'user@cms.ru', true, true);

INSERT INTO public.role(id, name)
VALUES
    (1, 'ROLE_ADMIN'),
    (2, 'ROLE_MANAGER'),
    (3, 'ROLE_USER');

INSERT INTO public.privilege(id, name)
VALUES
    (1, 'PV_1'),
    (2, 'PV_2'),
    (3, 'PV_3'),
    (4, 'PV_4');

INSERT INTO public.users_roles(user_id, role_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO public.roles_privileges(role_id, privilege_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 3),
    (2, 4),
    (3, 4);
