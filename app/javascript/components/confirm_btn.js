const confirmBox = () => {
  const button = document.getElementById("confBoxBtn");
  if (button) {
    button.addEventListener("click", (event) => {
      console.log("Event Listener is working!");
    });
  }
}


export { confirmBox }
