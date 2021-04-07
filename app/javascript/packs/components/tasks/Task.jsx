import React, { useState } from "react";

const Task = (props) => {
  const [title, setTitle] = useState(props.title);
  const [description, setDescription] = useState(props.description);
  const [edit, setEdit] = useState(false);

  const handleChangeTitle = (event) => setTitle(event.target.value);
  const handleChangeDescription = (event) => setDescription(event.target.value);

  const updateItem = async () => {
    const url = `/api/v1/tasks/${props.id}`;
    const task = { title, description };
    const data = {
      method: "PUT",
      body: JSON.stringify(task),
      headers: {
        "Content-type": "application/json; charset=UTF-8",
      },
    };
    const request = await fetch(url, data);
    await request.json();
    editToggle();
  };

  const deleteItem = async () => {
    const url = `/api/v1/tasks/${props.id}`;
    const data = { method: "DELETE" };
    await fetch(url, data);
  };

  const editToggle = () => setEdit(!edit);

  return !edit ? (
    <div>
      <p>{title}</p>
      <p>{description}</p>
      <button onClick={deleteItem}>Delete</button>
      <button onClick={editToggle}>Edit</button>
    </div>
  ) : (
    <div>
      <p>
        Title:
        <input type="text" value={title} onChange={handleChangeTitle} />
      </p>
      <p>
        Description:
        <input
          type="text"
          value={description}
          onChange={handleChangeDescription}
        />
      </p>
      <button onClick={updateItem}>Ok</button>
    </div>
  );
};

export default Task;
