function downloadCSV() {
    var data, filename, link;
    var activeTab = $('#alphaModelActive').val() === 'Active' ? 'alpha' : $('#betaModelActive').val() === 'Active' ? 'beta' : '';
    var $exportJsonData = '';
    var $fileName = '';
    switch (activeTab) {
        case 'alpha':
            $fileName = 'alphaModelExport.csv';
            $exportJsonData = JSON.parse($('#alphaModelData').val());
            break;
        case 'beta':
            $fileName = 'betaModelExport.csv';
            $exportJsonData = JSON.parse($('#betaModelData').val());
            break;
    }
    
    var csvExportContent = convertObjectArrayToCSV($exportJsonData);
    exportDataFile($fileName, csvExportContent);
}

function exportDataFile(filename, data) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(data));
    element.setAttribute('download', filename);
    element.style.display = 'none';
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
}

function convertObjectArrayToCSV(data) {
    var result, ctr, keys, columnDelimiter, lineDelimiter, data;
    var arrayConstructor = [].constructor;
    var objectConstructor = {}.constructor;

    if (data === 'undefined' || data.length === 0) {
        return null;
    }

    columnDelimiter = ',';
    lineDelimiter = '\r\n';

    keys = Object.keys(data.RESULTS[0]);

    resultHeader = '';
    result = '';
    resultHeader += keys.join(columnDelimiter);
    subresultHeader = 0;

    data.RESULTS.forEach(function (item) {
        ctr = 0;
        result += lineDelimiter;
        keys.forEach(function (key) {
            if (ctr > 0)
                result += columnDelimiter;

            if (key === 'VALS') {
                if (item[key].constructor === arrayConstructor) {
                    if (item[key][0].constructor === objectConstructor) {
                        if (subresultHeader === 0) {
                            resultHeader += "," + Object.keys(item[key][0]).map(function (el) { return 'VALS\\' + el; }).join(columnDelimiter);
                            subresultHeader++;
                        }
                        for (i = 0; i < item[key].length; i++) {
                            if (i > 0) {
                                result += ",," + String(i) + ",";
                            }
                            else {
                                result += String(i) + ",";
                            }

                            Object.keys(item[key][i]).forEach(function (innerKey) {
                                if ((item[key][i][innerKey]).constructor === arrayConstructor) {
                                    result += "\"" + (JSON.stringify(item[key][i][innerKey])) + "\"";
                                }
                                else {
                                    result += JSON.stringify(item[key][i][innerKey]);
                                }
                                result += columnDelimiter;
                            });
                            result += lineDelimiter;
                        }
                    }
                    else {
                        result += "\"" + (JSON.stringify(item[key])).replace("\"", "") + "\"";
                    }
                }
            }
            else {
                result += item[key];
            }
            ctr++;
        });
    });

    return resultHeader + result;
}
