window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.action === "mostrarNotificacao") {
        let iframeId;
        if (data.tipo === "boticario") {
            iframeId = "iframe_boticario";
        } else if (data.tipo === "empresa") {
            iframeId = "iframe_empresas";
        } else if (data.tipo === "juridico") {
            iframeId = "iframe_juridico";
        } else if (data.tipo === "oficial") {
            iframeId = "iframe_oficial";
        } 
         else if (data.tipo === "erro") {
            iframeId = "iframe_erro";
        } 

        if (iframeId) {
            const iframe = document.getElementById(iframeId);
            
            iframe.style.display = "block";
            
            iframe.contentWindow.postMessage({
                action: "exibirNotificacao",
                message: data.message,
                duracao: data.duracao
            }, "*");
        
            setTimeout(function(){
                iframe.style.display = "none";
            }, data.duracao + 100);
        }
    }
});
