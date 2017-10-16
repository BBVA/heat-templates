#cloud-config
write_files:
  - content: |
      #!/bin/bash
      volume_id="%volume_id%"
      volume_dev="/dev/disk/by-id/virtio-$(echo ${volume_id} | cut -c -20)"
      mkfs.ext4 ${volume_dev}
      mkdir -pv %mount_dir%
      echo "${volume_dev} %mount_dir% ext4 defaults 1 2" >> /etc/fstab
      mount %mount_dir%
    path: /tmp/format-volume-disks
    permissions: '0700'
runcmd:
  - /tmp/format-volume-disks