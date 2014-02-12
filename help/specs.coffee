#
# # Specs Help
#
{c} = require '../lib/colors'

module.exports = """
The default Koding Virtual Machines come with the following specs:

  RAM:    2.0Gb
  Disk:   3.4Gb
  CPU:    Burst

Note that your specs may differ if you have purchased additional resources,
have referrals, or have taken part in Koding Promotions.

Type the following command to see your storage capacity on this VM:

  #{c.b}df -h#{c.x}

Additional resources will be purchasable from Koding in the near future.
"""
