### To Run

```bash
docker run --name bind --restart always --hostname dns.acuminous.meh -d -p 53:53/udp -v $(pwd)/volumes/bind:/mnt/bind cressie176/bind:0.1
```

### To Build

```bash
docker bulid -t cressie176/bind:0.1
```
