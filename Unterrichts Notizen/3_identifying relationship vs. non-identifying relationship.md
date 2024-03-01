# identifying relationship vs. non-identifying relationship

## Identifying Relationship

- In einer Identifying Relationship ist der Primärschlüssel der abhängigen Entität auch ein Fremdschlüssel in der Beziehungstabelle.

- Der Primärschlüssel der abhängigen Entität besteht aus dem Primärschlüssel der Hauptentität und einem oder mehreren Attributen.

- Die abhängige Entität kann nicht ohne die Hauptentität existieren.

- Beispiel: Ein Flugzeug hat eine Seriennummer. Die Seriennummer ist eindeutig für jedes Flugzeug. Die Seriennummer ist ein Attribut des Flugzeugs und ein Primärschlüssel der Flugzeugtabelle. Ein Flugzeug hat auch eine Flugnummer. Die Flugnummer ist eindeutig für jedes Flugzeug und eindeutig für jeden Flug. Die Flugnummer ist ein Attribut des Flugzeugs und ein Attribut des Fluges. Die Flugnummer ist ein Primärschlüssel der Flugtabelle. Die Flugnummer ist auch ein Fremdschlüssel der Flugzeugtabelle.

## Non-Identifying Relationship

- In einer Non-Identifying Relationship ist der Primärschlüssel der abhängigen Entität nicht ein Fremdschlüssel in der Beziehungstabelle.

- Der Primärschlüssel der abhängigen Entität besteht aus dem Primärschlüssel der Hauptentität und einem oder mehreren Attributen.

- Die abhängige Entität kann ohne die Hauptentität existieren.

- Beispiel: Ein Flugzeug hat eine Seriennummer. Die Seriennummer ist eindeutig für jedes Flugzeug. Die Seriennummer ist ein Attribut des Flugzeugs und ein Primärschlüssel der Flugzeugtabelle. Ein Flugzeug hat auch eine Flugnummer. Die Flugnummer ist eindeutig für jeden Flug. Die Flugnummer ist ein Attribut des Fluges und ein Primärschlüssel der Flugtabelle. Die Flugnummer ist auch ein Fremdschlüssel der Flugzeugtabelle. Die Flugnummer ist nicht eindeutig für jedes Flugzeug. Ein Flugzeug kann mehrere Flüge haben. Die Flugnummer ist ein Attribut des Fluges und ein Fremdschlüssel der Flugzeugtabelle.

### **Identifying Relationship**

An identifying relationship between two tables means that the child table cannot be uniquely identified without the parent table. Essentially, the child table's existence is strongly linked to the parent table.

Let's say each book in the **`Books`** table must be linked to an author in the **`Authors`** table because a book can't exist without an author in this scenario. The relationship between **`Books`** and **`Authors`** is identifying because the identity of a book (in the context of our database) is partially determined by the author it's associated with.

To establish this relationship, we might have a foreign key in the **`Books`** table that points to the **`Authors`** table, ensuring every book is tied to an author.

### **Non-Identifying Relationship**

A non-identifying relationship means that the child table can be identified independently of the parent table. The link between them is more of an association rather than a strict dependency.

Imagine now we have a **`Publishers`** table, and we want to link it with the **`Books`** table. A book can exist without necessarily being tied to a publisher in our database's context (maybe it's self-published or the publisher is unknown). The relationship between **`Books`** and **`Publishers`** is non-identifying because a book's identity doesn't depend on the publisher.

In this case, the foreign key from the **`Books`** table to the **`Publishers`** table might allow null values, indicating that a book can exist without a linked publisher.

### **Summary with Examples**

- **Identifying Relationship Example**: A book must have an author to exist in our **`Books`** table, so **`Books`** to **`Authors`** is an identifying relationship.
- **Non-Identifying Relationship Example**: A book can exist without a publisher in our **`Books`** table, so **`Books`** to **`Publishers`** is a non-identifying relationship.

> Quelle: [ChatGPT](https://chat.openai.com/)
