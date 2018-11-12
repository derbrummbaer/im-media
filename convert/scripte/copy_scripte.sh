#!/bin/bash

#!/bin/bash

cp /mnt/scripte/run_scripte.sh /usr/local/bin/

chmod +x /mnt/scripte/run_scripte.sh
chown mediaeditor:mediaeditor /mnt/scripte/run_scripte.sh

/usr/local/bin/run_scripte.sh $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12

exit
