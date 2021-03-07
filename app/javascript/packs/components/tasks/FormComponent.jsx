import React, { useState } from "react";

const FormComponent = (props) => {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  const handleChangeTitle = (event) => setTitle(event.target.value);

  const handleChangeDescription = (event) => setDescription(event.target.value);

  const addItem = async () => {
    const data = { title, description };
    const url = "http://localhost:3000/api/v1/tasks";
    const request = {
      method: "POST",
      body: JSON.stringify(data),
      headers: {
        "Content-type": "application/json; charset=UTF-8",
      },
    };
    const response = await fetch(url, request);
    console.log(response);
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

export default FormComponent;
