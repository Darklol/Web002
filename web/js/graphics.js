function getUrlContext() {
    const link = document.location.href.split('/');
    return link[3];
}