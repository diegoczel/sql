/*
alter table tb drop column col;

não permitido dropar col que é pk ou fk
dropar col que tem constraint check, deve-se excluir a constraint primeiro dai a col.
*/