// app/javascript/application.js  

var $zoomElements = [ 'B000', 'B000','B001', 'B001' ,'B002', 'B002','B003', 'B003','B004', 'B004','B005', 'B005','B006', 'B006','B007', 'B007','B008', 'B008','B009', 'B009','B010', 'B010','B011', 'B011','B012', 'B012','B013', 'B013','B014', 'B014','B015', 'B015','B016', 'B016','B017', 'B017','B018', 'B018','B019', 'B019','B020', 'B020','B021', 'B021','B022', 'B022','B023', 'B023','B024', 'B024','B025', 'B025','B026', 'B026','B027', 'B027','B028', 'B028','B029', 'B029','B030', 'B030','B031', 'B031','B032', 'B032','B033', 'B033','B034', 'B034','B035', 'B035','B036', 'B036','B037', 'B037','B038', 'B038','B039', 'B039','B040', 'B040','B041', 'B041','B042', 'B043','B043', 'B044','B044', 'B045','B045', 'B046','B046', 'B047','B047', 'B048','B048', 'B049','B049', 'B050','B050', 'B051','B051', 'B052','B052', 'B053','B053', 'B054','B054', 'B055','B055', 'B056','B056', 'B057','B057', 'B058','B058', 'B059','B059', 'B060','B060','B061','B061', 'B062','B062', 'B063','B063', 'B064','B064', 'B065','B065', 'B066','B066', 'B067','B067', 'B068','B068', 'B069','B069', 'B070','B070', 'B071','B071','B072','B072', 'B073','B073', 'B074','B074', 'B075','B075', 'B076','B076', 'B077','B077', 'B078','B078', 'B079','B079', 'B080','B080', 'B081','B081', 'B082','B082','B083','B083', 'B084','B084', 'B085','B085', 'B086','B086', 'B087','B087', 'B088','B088', 'B089','B089', 'B088','B088', 'B089','B089', 'B090','B090', 'B091','B091','B092','B092', 'B093','B093', 'B094','B094', 'B095','B095', 'B096','B096', 'B097','B097', 'B098','B098', 'B099','B099', 'B100','B100', 'B101','B101', 'B102','B102','B103','B103', 'B104','B104', 'B105','B105', 'B106','B106', 'B107','B107', 'B108','B108', 'B109','B109', 'B110','B110', 'B111','B111', 'B112','B112', 'B113','B113','B114','B114', 'B115','B115', 'B116','B116', 'B117','B117', 'B118','B118', 'B119','B119', 'B120','B120', 'B121','B121'];
    var $zoomSettings = {
        B000: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B000: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B001: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B001: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B002: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B002: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B003: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B003: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B004: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B004: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B005: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B005: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B006: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B006: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B007: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B007: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B008: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B008: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B009: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B009: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B010: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B010: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B011: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B011: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B012: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B012: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B013: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B013: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B014: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B014: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B015: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B015: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B016: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B016: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B017: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B017: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B018: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B018: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B019: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B019: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B020: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B020: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B021: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B021: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B022: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B022: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B023: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B023: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B024: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B024: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B025: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B025: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B026: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B026: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B027: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B027: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B028: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B028: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B029: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B029: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B030: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B030: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B031: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B031: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B032: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B032: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B033: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B033: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B034: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B034: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B035: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B035: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B036: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B036: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B037: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B037: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B038: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B038: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B039: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B039: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B040: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B040: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B041: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B041: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B042: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B042: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B043: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B043: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B044: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B044: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B045: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B045: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B046: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B046: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B047: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B047: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B048: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B048: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B049: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B049: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B050: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B050: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B051: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B051: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B052: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B052: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B053: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B053: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B054: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B054: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B055: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B055: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B056: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B056: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B057: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B057: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B058: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B058: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B059: {
            zoomH: 50,
            zoomW: 31,
            zoomOutH: 32,
            zoomOutW: 32
        },
        B060: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B060: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B061: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B061: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B062: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B062: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B063: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B063: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B064: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B064: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B065: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B065: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B066: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B066: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B067: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B067: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B068: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B068: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B069: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B069: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B070: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B070: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B071: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B071: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B072: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B072: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B073: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B073: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B074: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B074: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B075: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B075: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B076: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B076: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B077: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B077: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B078: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B078: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B079: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B079: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B080: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B080: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B081: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B081: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B082: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B082: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B083: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B083: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B084: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B084: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B085: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B085: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B086: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B086: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B087: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B087: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B088: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B088: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B089: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B089: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B090: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B090: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B091: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B091: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B092: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B092: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B093: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B093: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B094: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B094: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B095: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B095: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B096: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B096: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B097: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B097: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B098: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B098: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B099: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B099: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B100: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B100: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B101: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B101: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B102: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B102: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B103: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B103: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B104: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B104: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B105: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B105: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B106: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B106: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B107: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B107: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B108: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B108: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B109: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B109: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B110: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B110: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B111: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B112: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B113: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B113: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B114: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B114: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B115: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B115: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B116: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B116: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B117: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B117: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B118: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B118: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B119: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B119: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B120: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B120: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B121: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },
        B121: {
            zoomH: 200,
            zoomW: 100,
            zoomOutH: 50,
            zoomOutW: 31
        },

    };
    document.addEventListener("turbolinks:load", function () {

jQuery( function() {

    for( var $i = 0; $i < $zoomElements.length; $i++ ){
        jQuery( '#' + $zoomElements[$i] ).mouseover( function () {
            jQuery( this ).css( 'height', $zoomSettings[this.id].zoomH + 'px' );
            jQuery( this ).css( 'width', $zoomSettings[this.id].zoomW + 'px' );
            jQuery( this ).css( 'position', 'absolute' );
        } );
        jQuery( '#' + $zoomElements[$i] ).mouseout( function () {
            jQuery( this ).css( 'height', $zoomSettings[this.id].zoomOutH + 'px' );
            jQuery( this ).css( 'width', $zoomSettings[this.id].zoomOutW + 'px' );
            jQuery( this ).css( 'position', 'unset' );
        } );
    }
    var image_src ='';
    var count = 1;
    var choice_img = [];
    $(".btl").each(function(index, element) {
        $(element).click(function(e) {
            
        image_src = $(element).attr("src");
        if (choice_img.length < 4) {
            choice_img.push($(element).attr("id"));
            //$('#bottle' + count).val($(element).attr("id"));
            $('#bottle_hid_' + count).val($(element).attr("id"));
        }else {
            alert('4つ以上選択できません');
        }
        console.log('.btl');
        console.log(image_src + 'がクリックされました。');
        if ( count <= 4) {
            $(`#bottle${count}`).attr('src', image_src);
            count++;
        }
        });
    });
        
    } );
});

