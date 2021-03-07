import React, { useState } from "react";

const Form = (props) => {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  const handleChangeTitle = (event) => setTitle(event.target.value);

  const handleChangeDescription = (event) => setDescription(event.target.value);

  const addItem = async () => {
    const data = { title, description };
    const url = "/api/v1/tasks";
    const request = {
      method: "POST",
      body: JSON.stringify(data),
      headers: {
        "Content-type": "application/json; charset=UTF-8",
      },
    };
    await fetch(url, request);
  };

  return (
    <div>
      <h1>Add task</h1>
      <div>
        <input
          type="text"
          placeholder="Task title"
          value={title}
          onChange={handleChangeTitle}
        />

        <input
          type="text"
          placeholder="Task description"
          value={description}
          onChange={handleChangeDescription}
        />

        <input type="submit" value="Send" onClick={addItem} />
      </div>
    </div>
  );
};

export default Form;
