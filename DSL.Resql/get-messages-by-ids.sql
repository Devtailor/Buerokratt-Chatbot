SELECT chat_base_id, base_id, content, event, author_id, author_timestamp, author_first_name, author_last_name, author_role, rating, created, updated
FROM message
WHERE base_id = ANY(ARRAY [ :messageIds ]) AND
    id IN (SELECT max(id) FROM message WHERE chat_base_id = :chatId GROUP BY base_id)
