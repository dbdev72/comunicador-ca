'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "f41191bb585c1ce8dcdea2d25fbaea8a",
".git/config": "4f62ead5c21e21d5d3e19c06fca5d4e0",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "3c42be9f885d89bb74ae8e4699012f2c",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d91e0d8abd16186a0beaa61bb32d9697",
".git/logs/refs/heads/gh-pages": "4011df8ce4a3df8c938bfea0bc006ba1",
".git/logs/refs/remotes/origin/gh-pages": "bd3ade099bbb8b51161a64a853616940",
".git/objects/06/fa3999db209ac78a5731c446852c190f5f5a4e": "83d22b85274dd9bb96536df64c1c32c4",
".git/objects/0a/b24b4bca9631c79a7755f8a5c96ba0c921b5df": "f50005dfa05db48d39b8c28e2198c8e6",
".git/objects/0d/cfceb6beb4693b904bb2656ebbf5f11aa8d135": "9955b37f38e797f7fb409b0b790edf43",
".git/objects/11/b133c6aaf3b258afdd866d53275349a558acc4": "5740da0452785cc23b219d89118a9095",
".git/objects/15/4eaec7968ba81f83a6f679546513c56351b6a2": "aaaee3a9279e2b5c2bf3531d01a90f1b",
".git/objects/15/75d512d8849a150a2b1ba7d1b0c0047834f3d7": "43b869653523262c6d913786d98d6352",
".git/objects/16/7085f73797ce27bf432a87beac6861abb30e92": "f51009516807d31d57f57dfe3d80ef9c",
".git/objects/16/b78bd6be85dd6d4a077f51e72389d987c0fedd": "11c606fbd4428f846f6321d09d0e181c",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1c/03d4c0e4767dc48ba2d6b3126f077ff484763e": "373192f2c6647c57f18b51f2bf898f0e",
".git/objects/21/33c1413007182560a64119d03a9593ff5dfbb3": "70560162ed867dee0537641ad2184d32",
".git/objects/22/dd1c8f57da724624197eed6630e3091952b064": "31e66461fa456491581220484cc15ab9",
".git/objects/26/b8f5f0ab3dce30dd1f391c35d9f01ed8b62aec": "b3825560da3f499014c91b6c3da80b2d",
".git/objects/29/b76a0bf9f95561f357f51ff62d051a8fee3248": "9cc247638b063d066be3ec0b1a0d228c",
".git/objects/2a/55f38a1ce2ce3e9a4d6636e7316a04f68121be": "87d6106d12491c767ef4ab6d5f3758a5",
".git/objects/2a/7d36da9451faf9c38daa5627842b4c4703a566": "afb17759b20b463a1c1ec10a76352582",
".git/objects/2b/ace7b2a08aec48d53c5347735f17edeca38862": "0eaa7592722e6ca7e975d6b32f0ad9f2",
".git/objects/2c/3542b78070a206fa127900e38c3fcb7a406ee8": "e9b71f163439d096a8f668611405ccf9",
".git/objects/30/2d4fa8aff72a013516d9144227ce23b532953d": "6e90a17fa16199240b139e9907ef72d8",
".git/objects/31/f65294e39d4498e03ae02193a142e4be2dc3aa": "67d67c6057f0959db35fccff2122c435",
".git/objects/32/fd2ed92611e96e2eb355fab385ec05f9c08e14": "0eb231392819808befad356e94c4828f",
".git/objects/37/0a555ea4a292939765c22b4c9b15c51ba752b6": "b82fbdb6ebe38fc21fc12337ae97b639",
".git/objects/37/da44925b7665a4194f2546b315264a18289cd2": "3ff54c58531a80a5aec73f9e959746aa",
".git/objects/3a/a32743c1ed4f652bc4d1bb480ff7fd578ef332": "5930d991c8a8b8066c4c80bf51aa1f84",
".git/objects/3b/0d692ec0e7e6369c708081033c4fb7ab95d682": "911ba213a7e20462082eeb3766e3aa52",
".git/objects/3b/4e07400f93c47ec54ec294882ea50fde198020": "fe8ead799e7b34187fbcb1b4321a6420",
".git/objects/3b/c24efeeb6ee2f288131eef6c466b042a7d88e3": "85cd76ed2f8ef8d1384c1e7888037316",
".git/objects/3e/fefc1787060def02aed18a53b1290afc0e06c1": "76e70454e3ae5715a7bb57f409eb11a4",
".git/objects/41/0e95f3757e670e7b188a770f519541ef6289cc": "2f0ad4f0e3f618c5570cb67fadf2855a",
".git/objects/41/59238c39ad619a5e6325be7e31c578ab77608a": "2db5bd4c6ca29cb355fe29738bc9524f",
".git/objects/41/86d6055f70840622d6ec82c2c1dfe8e97682a3": "3e3afc325ade861902f89a21e7345497",
".git/objects/43/035ce089cc14475080f913d1fcd12b2a575a83": "9929b34b64bd7784f4d6a5e725ac480b",
".git/objects/43/6436567c2b393098c13d586c15dfa07334a1f6": "bcf2c636866ad2f37f2c22725fc0e61c",
".git/objects/45/246635165e6d264ebec76aa37105be71d101f6": "66da48fe1f01fb3c301ab646415b7c7e",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/50/c71c76df8f982e1a4013fa181163072dd54622": "46ce0b3d4afdc66e3b56f07d7a1b121c",
".git/objects/51/6cd94735eb0970aeb65ed2f728b8ca43e554b7": "767cdfa1cd0a47fc73adddcfecbab67e",
".git/objects/52/c1f57344eded0f2117b277f0725ede9ac33ea9": "0e29b5d4b8a4c7fc9dc50134ed675fff",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/221c20bc25d12014174ad542e1537f0e1ea036": "8aea0e609775aa5985e2ce29a46739df",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/54/75d3c9b896dc59ec6cbd4b374ab37e893ea30f": "0aeb09804199c4587da3d7d7600882d7",
".git/objects/55/9b4f474b7e977e3bf3cce25f12b6455f551301": "e719e76c2de3073e86adfac053040adc",
".git/objects/58/e30c6a1cb85424610c8ed286e63311bb604c82": "060693ecc1b7ff1deb96a41941873bd5",
".git/objects/5c/7479056a58d0dc8608fdf94b8e312ee9a832ab": "1bc5e5439d490a73ff6e1791345bfed0",
".git/objects/5c/f46877fc0ec50ef680bbe4df855ebcf4da6ea1": "524b6742da2937f15bd7d0707b1ad32f",
".git/objects/5c/f77dedfb6ad405786ac07677b5ea92cd2ebf0d": "ff8f73d8f2ab1ddb80ad0812305c7a18",
".git/objects/6a/7c32e1db5be944e71e7cb758cfca0241c5b401": "fe8e6e5730bbd54e5626d54c215b5424",
".git/objects/6a/ca1df93d8855213e9ae4f355f6de0e6e03d7b8": "f2e0f9e265cf6ef0eefca2636e747074",
".git/objects/6a/de84b121cbfe98614725b8f22407208805862d": "87bff790fce6cf31e8b5564a7154aade",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6d/58a016e66231ed1c8c6582090efdedfef4a8d5": "daa2d28789c250ee60c56748ef2c3a92",
".git/objects/6e/66069e897484ae429679a0bcc92b27ddffae95": "8a2cab7047fb6c04c659e69875ae5c05",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/71/a25aef4e7932d1a08a9e5849828ad13ef0e61c": "0d355c44d0237496af1d6eb527445456",
".git/objects/72/2ed8b67715b8c422190ae7ba60fe3686c66d6f": "aee6ab867d1710e42b1f20de600cfb9e",
".git/objects/72/bb213dc3e7805ebf69f50d3db357a8ae41423d": "d278b82e7cec143f6470beae49f1a3e2",
".git/objects/73/57e8811a92dd95207611df70b2b883a4ecf1cd": "3cb08efe6dd88e1e5119a1ebfa44f297",
".git/objects/73/ac43ad2ed8fe40c957ae610762a4857fb17174": "2a33a750c50c0650f95cf3c3e785ffc2",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/74/c87e49917b6511f72074252b69c6a49d142d51": "b861f3b3181be9551dffc281d070f714",
".git/objects/78/c7e1a341717dd2d922c54fe15c36291e48372b": "cd7cc112adf11730fab287fe62b75347",
".git/objects/79/ae2b88d4db002fc7e3143c4007e4ce0886652d": "fe781b604140f13b06c443355b7f3a3e",
".git/objects/7a/0d0c38e5d1861f67d0eed2f57c9b7e14a79019": "caebaddae7dce797d3836295ac83b6e2",
".git/objects/7b/fd98b2957838a2ee6ab28da758c563a65a564d": "0f9843faa28c346dc0d51f74d8d53da4",
".git/objects/7d/649a4c91d1c7121c33a1e3dedc37f192dac3aa": "c34ffa9c2007f0838c41e74a5c41c61d",
".git/objects/81/610bb732a8c3b141a9f19a805f9a8f96361167": "96fff37e2d9494077c51a7077d581657",
".git/objects/82/94b0ab522d7751b0df27d68d4771971d4c4259": "31ec6a7c284058bbcff624385ac2011b",
".git/objects/85/2c3d7d428d360ffce71bae08566ddd7d52e3f1": "5c5a59977a3c79ee05425eaf5cf6e998",
".git/objects/85/65a3eeca78c757325381f31ddaaba6035febc0": "b8d4c0b1465c37da92fafcaf089b6112",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/2ee9bfbabc6dc4d5bc0ecb02387a781187aaf6": "8f1461662b8053736f145ad6d0db1e25",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/8e/53469756d41a037d51be8dcbaec0028b0ce80a": "04e3b54b9c4dbe2d8d4e97ae1abce063",
".git/objects/8f/066dd2a8aba6c91f50e06b3209b96b259c49d6": "9f98e9e503ed1094302836902ffbfff6",
".git/objects/8f/8ff4dc8941371fb2fda9c6bc9bebff5d2ba1be": "b17fa3e9befed8378ec93f6ed2610996",
".git/objects/98/49c9fd8a520c9ec7ddcded9786714f291b9d92": "884ecdb26db8474e31fe293025ba97ad",
".git/objects/99/7471079463adfd040252f94e669f97d947964c": "a68b4b898b6a8344aaaaeb1d87a45d0f",
".git/objects/9b/3683475d091104f1f5b8cb0039fcf519d2d02b": "57591860368d7a411b5aa398ff9139c4",
".git/objects/9b/c47efa5941d2bca708b4ee9b0e2f45045f53e2": "695df97bb0d2df76f95ea79005bfd690",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9c/ae60bf266056ac514386be846c7905bbb40f85": "ff245db729e3f72d66174679e6ec769d",
".git/objects/a0/917e48a884cc1c7e5b8b5b4030a8d6f43b0d20": "22180722324bd52628e1918fea898fdf",
".git/objects/a1/0adf8546e431cfbeeccb5501e162c8a9c66599": "5b2660d148cfc81a4fae34d6bc10255d",
".git/objects/a4/5b9346b24e0a5ed3d520e06892e40aa4c41dac": "cd42cf84997c97bf732fb3110a072423",
".git/objects/aa/06d3f457366c8269c96ba017766fd7f53c12eb": "ee2fcf6a4f0b53bd840527c8ea543d5a",
".git/objects/af/587fb99a05624eab7db9134cf645566096a8ad": "771782f8209bc439749594cbf7df166f",
".git/objects/af/65bc4500cf4d6b8eb0767e516d230231afbf3a": "63c031a7fd4a34e81f88de683f63b643",
".git/objects/b1/8a85acbe3756a710e1abf6d5010839129203dd": "d9d6d7b7a9fa3fc4b647e2b14a28e7de",
".git/objects/b2/420f90d420508aec824d5564fe5a5d28bbd1bc": "6fda4e39d418af7744743745aaf6d90f",
".git/objects/b6/609efae40c5139e7bbc8230622071ab933f2fb": "46c88efe0f960cd5dbfa100150ea3e7d",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/95c54092f6720d0a552f9151fe789435c33df0": "d164a137e6601485c1ddd24ca6186317",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/bb/95d456e625e7a6c03aa3213ff086af9e37d842": "bb958b54a95d6fdba5e47af13bdf19db",
".git/objects/bb/bdc326a9927dca114da83711f109b0ce613960": "5b1da34f2f41c0678c6d84ac6a96cf07",
".git/objects/bb/d4d309c15e6d13d335a13670082d2e05a25661": "579c991fa20cdbc6bce52c3985b85463",
".git/objects/bd/21527a69cc65cdb743b46f655cfbd8eb496087": "1792b26472ff1c62ddd18c40d0dfa3c5",
".git/objects/c1/6c9f1523aa6ed007f82b9ecf41a62bd19ff02d": "8a97dd73207355ecb3818d1bd028cb7d",
".git/objects/c3/29049823034245cc457754169a6d2ee86a0490": "a99e31dceda782c6ca34dd7e10121e69",
".git/objects/c3/7be9369c30716d8cdfdd1bd837b2e2a6283899": "f4bb7205faf7758a83b42258e752370f",
".git/objects/c3/ea47c12249d04789842e5f0bec6205f7499b0a": "aa157bbf810a5b9b6f96ae0ab7667d11",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/c8/2c389c397a826aca5ac5c9fdb2638ac81507f2": "32fae340cf3fc2d4c3ccc54e7a77e0ac",
".git/objects/ca/eec04253e6f7fafff4f325a8f79500a102f799": "8c17294f4e9bff769a23703b3a5c807d",
".git/objects/ca/f2113812f92ba7f02ef49d416e6513a14199e5": "45e88ce7a2b23ba33ed4229fc4a746f6",
".git/objects/cb/2c64443d63668f743fc389d1a552ce10feb372": "db01200b1fff8991190b3ef44b24cd66",
".git/objects/cd/6a442b2f1de21000f7257718961782d6fad4e0": "876a49f811445550ebbc0e16de00d8be",
".git/objects/d2/6573bd330e85ba3a1fdc9e53077783257e8abc": "fc1b9d75bace4e213961b43014419711",
".git/objects/d2/c26ee541593f1b07997f72bb0af6dd2d91d3f5": "ad5679374f320ab8b4733d1a92eee7b4",
".git/objects/d3/c963d25cdaf4a5fd41fc569f95afcfed449647": "12ff031568e32983b0ffb777c6b9ea43",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d8/7a7482f737ade2d3c77347b53f06b5c4e5204c": "c43c210740284fd22325f93551f2a3eb",
".git/objects/da/42f0ebe9d7d2f6710788622525151e1fcd4d8d": "7923f449ef437ef77cdd23787d4e31d6",
".git/objects/da/a6796e9d244286c4847cc0b9bb9477213c34d2": "cab5ff59ef62974a5283d6c42b340bb6",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/dc/abd1613eb019fe56b69eb471050bb7660cbab2": "72bc0236c3aeb9d847d61e6534a7475b",
".git/objects/de/ec0006e95c98337d3c0f0b477e17ccde0695de": "34ccd721a096d593d1a76d38b3a75348",
".git/objects/df/45ce8f8f8d5ac7ef32401726d85919574c36e4": "137f2e93baaa823f230cb9daae037b16",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e2/7a96c427a533ebc73842134fb46dbf080546a7": "e296f18a3a1f5ba5dfc8a5caeefd2116",
".git/objects/e2/aa061fa5670d12f4132321d1c9ca1cb7e6565b": "d6ecf1cc362583e616c6f68dc141025e",
".git/objects/e3/e4903c36732d42d7f28d8ef1ac30adcda21994": "ac872c3b2652990166fc67404aee9ac5",
".git/objects/e4/29431d6a0c78ef7b30d5b5b9e64f2c5f055f0a": "a2467a6c077431f24631bebb1aba734f",
".git/objects/e5/2ef85f068ecadf811561174235d8bf6bccdd11": "f0b6d46f7d2fda5ffc4785e16aaf4db3",
".git/objects/e6/470b5f51bfcc0c80ad06e3ac2e7f919d0e4713": "82a227c138daed9f212b553231b31028",
".git/objects/e7/d053ed72e75ca6c503d4610a6b6daba8d1ff4b": "83bf644abf63f62bf6baad7618e4f899",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e9/9b1446d628b972ed8e59f734e6f4d99b377f32": "246e11f55180eb519106caaed1f30561",
".git/objects/eb/8a74a7b0a86022df9374b4f129131b7dabe802": "61e9277da8a8345281759f92a5bd487f",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/4a9fb397aa1f91d5ab778eea9cb98b41c538f6": "f9b859df4ab91c6e8cba551be050a856",
".git/objects/ef/61abdf767dbf0069f9c52f8ff461d573174e6d": "ae70c076ef2654aa61276df03f0dc98c",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/417ce21c85032d4c5bb86e3b4dad93a3b0ac99": "234eb70dd608a1f032b8648714c8b1a1",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f7/1d2d90330bc7b1a5cf2a1683387393574e4a78": "43d7512b88b9c9bec5391393cd5fb03d",
".git/objects/f8/597057eea4d3ac237008ace75586157f8df493": "b32f618758ba4320c71fc81416cbbe51",
".git/objects/fa/760368fb3a2f2fac7dcf0c487b6fd2493e4672": "cb48986a0fd6701e12c9b6f64020e964",
".git/objects/fb/275d4edc73fe7e9d634d93384a12d6b730ca62": "803c6cc80d391758262156c69bc2ff0f",
".git/objects/fb/f5a0e361985d2a67f21bad829d43fdb059d861": "c2b1bff3b0ca936a892bd32fc5f5c9e6",
".git/objects/fc/c06c0e3193bc131be8d97caa18ad11be679df8": "bc63d5563e85a4efef8ea3bc3588113e",
".git/objects/fd/54f8dd799b5972e46945bd229ae12bd8d66a8b": "28208b1505c8de21220afc2c288a299a",
".git/objects/ff/c48c627f25e02bcd41865dcc242ac564ae943f": "ba47da24aad50e7e81adcafbf546db16",
".git/refs/heads/gh-pages": "41c2ff99918dbe275305c38b2923d5b2",
".git/refs/remotes/origin/gh-pages": "41c2ff99918dbe275305c38b2923d5b2",
"assets/AssetManifest.bin": "588632a03a8f28a32e2527c41da7cff5",
"assets/AssetManifest.bin.json": "ae120c2c463ec02b95c2de265250dab2",
"assets/AssetManifest.json": "b3b8ee7d3cf2de3dbf406264bba8f3da",
"assets/assets/meusPictogrames/agafar.png": "73f3b5f53e59c1c830d1ef51e3e87f9e",
"assets/assets/meusPictogrames/anar.png": "0aefa0d4c78f52744ffe93969ed9b654",
"assets/assets/meusPictogrames/ara.png": "b25d96c866ea5584730ed929dd4b123a",
"assets/assets/meusPictogrames/avi.png": "cbc789e239729771f584f4ea325b10c1",
"assets/assets/meusPictogrames/avia.png": "76d65a8ae30c7ea3d4f0fa4fdda4e79e",
"assets/assets/meusPictogrames/bin.png": "830133591be0d68bd843a026eed48980",
"assets/assets/meusPictogrames/bossaPa.png": "705d023e443c9d6075707ad6527f6876",
"assets/assets/meusPictogrames/botiga.png": "f60254e159adb6932eba5d040d89ecc6",
"assets/assets/meusPictogrames/burlete.png": "1b7b29564f8841ab5dfffc1b224999a2",
"assets/assets/meusPictogrames/cacaolat.png": "930a0bce435e1e0f1cc7eb02b822d217",
"assets/assets/meusPictogrames/carles.jpg": "8313a75ad60527e5b7087cf88bfda4d6",
"assets/assets/meusPictogrames/carnPeix.png": "fd61174c84cb24f817c36779748f15f5",
"assets/assets/meusPictogrames/casa.png": "4880a2421cf36b6c9cccffed2495c4ae",
"assets/assets/meusPictogrames/centreComercial.png": "0fe82390dd0334eb5fcaafecf9a52bf4",
"assets/assets/meusPictogrames/classe.png": "177d82c4b945a68cdb770f43e28d0e64",
"assets/assets/meusPictogrames/click.png": "5ffb36d246771a43aa2862c5d242d6ea",
"assets/assets/meusPictogrames/coc.png": "1efaf56315e504343a2010f972aaa30d",
"assets/assets/meusPictogrames/colorFormaMida.png": "b69b32e52abbbf466add3c2efe397b1c",
"assets/assets/meusPictogrames/comEstas.png": "e751c07e1fd97af9449d135f72ced5cc",
"assets/assets/meusPictogrames/compota.png": "c933240113a26d35cf6f8719cc9f59bb",
"assets/assets/meusPictogrames/contxi.png": "8de5488ae201b1de96872d5e4029b7cc",
"assets/assets/meusPictogrames/copy.png": "567c9a09c570295f08309cc51dbee60d",
"assets/assets/meusPictogrames/correfoc.png": "6901ae6c1d7f00e8cc78b5b3017af3e0",
"assets/assets/meusPictogrames/cosSalut.png": "9ac29a224dbceece804220086b6a79fc",
"assets/assets/meusPictogrames/del.png": "d2017dfff383408b499e906ee43b27e6",
"assets/assets/meusPictogrames/dijous.png": "967b3d2fb7bac8182ddbc623efde5f60",
"assets/assets/meusPictogrames/dilluns.png": "f1dea0886c6a570b8a260fba8cb63a65",
"assets/assets/meusPictogrames/dimarts.png": "720ddf0459c399c25e83f4f19310bd91",
"assets/assets/meusPictogrames/dimecres.png": "a1177443949e7905cd94799b4556cb66",
"assets/assets/meusPictogrames/dinar.png": "f1c842ddc6dd4ed0f5cbeed4746b2c38",
"assets/assets/meusPictogrames/dissabte.png": "ed8f633cc1a48f6a9c1f6f52fa8a3b89",
"assets/assets/meusPictogrames/diumuenge.png": "43ae11d593e33d33cf57ac65dd203fbc",
"assets/assets/meusPictogrames/divendres.png": "256feea56b26d6d6e84226960f5c6172",
"assets/assets/meusPictogrames/dolc.png": "1fd34830c2d459a7107dba369aeab83f",
"assets/assets/meusPictogrames/dreta.png": "fc9b62a8bba768d13e67e38a74587a6d",
"assets/assets/meusPictogrames/emFaMal.png": "a84572e9f299a8ec07de9ac78f6eb93e",
"assets/assets/meusPictogrames/enganxar.png": "e8a7db3b5b69c8fa203cb7b644aeed03",
"assets/assets/meusPictogrames/engranatge.png": "bd5f8ec979f06ccd85e2295487b28192",
"assets/assets/meusPictogrames/esclairs.png": "e85ef34eb418c4fa6fa9d01f6b11d05b",
"assets/assets/meusPictogrames/escollir.png": "aaf1b38e46f0a443347d6adbbc19ea97",
"assets/assets/meusPictogrames/esperar.png": "9dcff1f103f6fe70be5ffa2ee967386d",
"assets/assets/meusPictogrames/esquerra.png": "ea2b726559e2401505b55969c309b798",
"assets/assets/meusPictogrames/esther.jpg": "559d9ae910a0ba1a91e42688f75eef73",
"assets/assets/meusPictogrames/fanta.png": "ee7bf94878ff10f870327eeb8d5d7db0",
"assets/assets/meusPictogrames/fer.png": "5eb4092392078f688439bc82de5adbb6",
"assets/assets/meusPictogrames/fred.png": "1e3bc955f58490a2cdfe94ae352e1d91",
"assets/assets/meusPictogrames/fullScreen.png": "e4048fb33b839dd8f710693cdb3dda03",
"assets/assets/meusPictogrames/funciona.png": "c0f747b773211b41286dc58c1e9427ef",
"assets/assets/meusPictogrames/garatge.png": "b7dfb48be8a34b9e400c816536d3eabc",
"assets/assets/meusPictogrames/gracies.png": "8dd3d1e69893f33b30d0949e6310292a",
"assets/assets/meusPictogrames/guarnirArbre.png": "c8c0280c15c5ef0551a6c11b2be7b75d",
"assets/assets/meusPictogrames/home.png": "049d2aedc3f7abe47f2cf3a2ca5b2f54",
"assets/assets/meusPictogrames/horaDe.png": "b81917d0901250d9f1a6f5de51fb5078",
"assets/assets/meusPictogrames/joan.jpg": "ead11812b5f62ba2d439e7ff5e35935a",
"assets/assets/meusPictogrames/judit.jpg": "ad765ee34fa0ca275f2b01588e95f0b2",
"assets/assets/meusPictogrames/lilEinstein.png": "41b947e752bdaf40d6e058b0e2e5f930",
"assets/assets/meusPictogrames/mac.png": "04289e689c33cb00d9ef0ca9d49fcaaa",
"assets/assets/meusPictogrames/malDit.png": "47ef12fb34665e1cd71f9a2bd4d2eb79",
"assets/assets/meusPictogrames/malFerPipi.png": "65f97588da25dd6ec64c70981c704c84",
"assets/assets/meusPictogrames/malOrella.png": "4637a57b530ee3ae86295cb79ec70045",
"assets/assets/meusPictogrames/malPanxa.png": "d36185b7ebbabf7236d59867447fcd5f",
"assets/assets/meusPictogrames/marcos.png": "9e8b2843af44aeca04d45ba6671f0dd4",
"assets/assets/meusPictogrames/mato.png": "f2ac9c09970eee4be2b1a821c9f60360",
"assets/assets/meusPictogrames/metge.png": "30a878276abb29ffc133973474a64690",
"assets/assets/meusPictogrames/natalia.jpg": "ddf24f1cb106c4c7c97ba7e00d9ad81e",
"assets/assets/meusPictogrames/no.png": "00f860507c410de3e973364d8ab3d93b",
"assets/assets/meusPictogrames/nocilla.png": "cd04b3ce6c227763cea5923ce049eb78",
"assets/assets/meusPictogrames/noEntenem.png": "11cad5c004f6b635c3063773b0553334",
"assets/assets/meusPictogrames/noFunciona.png": "6ac5acf08c25db2de0a0aad02ae70e63",
"assets/assets/meusPictogrames/ouBalla.png": "c58b5cfe69f7be82be607dd1f523216b",
"assets/assets/meusPictogrames/paola.png": "e6b3a040048ff8ac51d4a9117df029eb",
"assets/assets/meusPictogrames/paRatllat.png": "8a8bdaed09550349c06d3a4c03a3eb0b",
"assets/assets/meusPictogrames/parcSama.png": "da9edcfd0300fa848e1040d3b60b26cf",
"assets/assets/meusPictogrames/parking.png": "2637f90bed9d4f65abf0504b99e372c2",
"assets/assets/meusPictogrames/pastForm.png": "c13303b05cdd596d94807500604f568b",
"assets/assets/meusPictogrames/persCol.png": "e36d358ab37d625849add6b1762b2a25",
"assets/assets/meusPictogrames/pilar.png": "74f40581cb0a1c1d06596da78728e872",
"assets/assets/meusPictogrames/pintar.png": "e649687d4ab2de29095d08aef6895816",
"assets/assets/meusPictogrames/play.png": "de4ad95083462db61198559007166d61",
"assets/assets/meusPictogrames/pluja.png": "ce311862ae29a43fc5235be4698057ec",
"assets/assets/meusPictogrames/pop.png": "01caf907bde7c59a5c3bafee25d1dc12",
"assets/assets/meusPictogrames/por.png": "489130cfe88c3bbf5701942817b94937",
"assets/assets/meusPictogrames/portAventura.png": "61b67a67560d99b25dcaec85285c448e",
"assets/assets/meusPictogrames/postre.png": "e4f776f0a41e8101b3e38af5b9ef02f7",
"assets/assets/meusPictogrames/puzzle.png": "ada421f1eaa7d4d5247f5d281d52cc61",
"assets/assets/meusPictogrames/recte.png": "a473a1258b8dbe0c6521106375b6bc67",
"assets/assets/meusPictogrames/restaurant.png": "b9c195ec15d851e1595b593254fe3b4e",
"assets/assets/meusPictogrames/retama.png": "c6d37a5e90d76d10e0dc3c0b2d73cd73",
"assets/assets/meusPictogrames/rollito.png": "c1fe1dda33f8728008ad16ebe0a3a9e7",
"assets/assets/meusPictogrames/rosa.png": "10b7d2cb99ef14fbd51cbe02564be470",
"assets/assets/meusPictogrames/salou.png": "b20aeeeab83d9286958a5350ab547a6c",
"assets/assets/meusPictogrames/santi.png": "bc94cb29e87ecd8aff3f0d3a1e7c0876",
"assets/assets/meusPictogrames/santiago.png": "d111ec8b4b803529c194b9c0e7826b6c",
"assets/assets/meusPictogrames/si.png": "8c08076d649cf8dd67f77390b1a03cd5",
"assets/assets/meusPictogrames/siUsPlau.png": "5f1d942ee54c5d1e25bd74957b796e55",
"assets/assets/meusPictogrames/stjordi.png": "6284deec10dd1f1358c9d5b3c75173fe",
"assets/assets/meusPictogrames/tabule.png": "e9f3f09fced3fd29929f40d443aa9a99",
"assets/assets/meusPictogrames/temps.png": "45359599ce1cd5cf8c2fa0a12aa696ac",
"assets/assets/meusPictogrames/thomas.png": "b73ec57e648e76f935ad9d5f92629067",
"assets/assets/meusPictogrames/toni.png": "8f06af2d66ac33c826c213211e7dcbfd",
"assets/assets/meusPictogrames/tortosa.png": "aae5450b0f4e54b547e859ebfde1de28",
"assets/assets/meusPictogrames/trineo.png": "55811162038fa73e93207f066eeb7dc3",
"assets/assets/meusPictogrames/undo.png": "aca1f20e734b40197b89f9d1fc7dcb12",
"assets/assets/meusPictogrames/ventosa.png": "1d34eea81fb589cf34ab747964c9c3a3",
"assets/assets/meusPictogrames/viena.png": "4eb9506e8ce1a50107b223fe6de8def9",
"assets/assets/meusPictogrames/voler.png": "c33d8f587bf0d8736ae4a86f261199ae",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "064e3d8bbd6345d611d2442235bd429f",
"assets/NOTICES": "050c9d5ba9464da348c0945c5ff52158",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "35a581c462405b3dadbf243d64772ab2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4182465b739a3625f0117593352e906d",
"/": "4182465b739a3625f0117593352e906d",
"main.dart.js": "ae09e8c2cedb59b5b67c0cb55002cbc8",
"manifest.json": "b51905b5ab5694eaf00e4abfba80cc6d",
"version.json": "0b385c610b9cc7fc26bf7c0a6b0df313"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
