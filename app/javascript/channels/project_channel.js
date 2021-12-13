import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  const projectsInInbox = document.querySelectorAll('#project-inbox .project-card-link');

  if (messagesContainer) {
    const id = messagesContainer.dataset.projectId;

    consumer.subscriptions.create({ channel: "ProjectChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }

  if (projectsInInbox) {
    projectsInInbox.forEach((project) => {
      const id = project.dataset.projectId;

      consumer.subscriptions.create({ channel: "ProjectChannel", id: id }, {
        received(data) {
          const container = project.querySelector(`#last-project-${id}-message`);
          container.innerHTML = data;
        }
      })
    })
  }
}



export { initChatroomCable };
