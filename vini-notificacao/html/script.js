window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.action === "exibirNotificacao") {
        
        let containerId;
        if (document.getElementById("notification_boticario_anuncio")) {
            containerId = "notification_boticario_anuncio";
        } else if (document.getElementById("notification_empresas_anuncio")) {
            containerId = "notification_empresas_anuncio";
        } else if (document.getElementById("notification-container")) {
            containerId = "notification-container";
        } else if (document.getElementById("notification_oficial_anuncio")) {
            containerId = "notification_oficial_anuncio";
        }
        if (containerId) {
            displayNotification(containerId, data.message, data.duracao);
        }
    }
});

function displayNotification(containerId, message, duracao) {
    const container = document.getElementById(containerId);
    if (container) {
        let notification = document.createElement("div");
        notification.classList.add("notificacao"); // Utilize a classe já definida no style.css
        notification.innerText = message;
        container.appendChild(notification);
        // Remove a notificação após o tempo definido
        setTimeout(function(){
            notification.remove();
        }, duracao);
    }
}
