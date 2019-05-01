// Use to debug network requests in React debugger.
export default function connectNetworkDebugger() {
    global.XMLHttpRequest = global.originalXMLHttpRequest
        ? global.originalXMLHttpRequest
        : global.XMLHttpRequest;
    global.FormData = global.originalFormData
        ? global.originalFormData
        : global.FormData;
    fetch;
    if (window.__FETCH_SUPPORT__) {
        window.__FETCH_SUPPORT__.blob = false;
    } else {
        global.Blob = global.originalBlob ? global.originalBlob : global.Blob;
        global.FileReader = global.originalFileReader
            ? global.originalFileReader
            : global.FileReader;
    }
}
