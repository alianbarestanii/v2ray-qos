<p align="center">
  <img src="https://img.shields.io/badge/V2RAY-BANDWIDTH_LIMITER-blue?style=for-the-badge&logo=linux&logoColor=white" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Release-v1.0.0-green?style=flat-square" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square" />
  <img src="https://img.shields.io/badge/Supported_OS-Ubuntu%20%7C%20Debian-orange?style=flat-square&logo=ubuntu" />
</p>

<h1 align="center">🚀 V2Ray QoS Speed Controller</h1>

<div dir="rtl">

<p align="center">
<b>یک اسکریپت سبک و قدرتمند برای کنترل پهنای باند کاربران V2Ray بدون تاثیر روی سرعت کل سرور</b>
</p>

---

## ⚡ نصب سریع

برای نصب یا آپدیت اسکریپت، دستور زیر را در ترمینال سرور اجرا کنید:
```bash
bash <(curl -Ls https://raw.githubusercontent.com/alianbarestanii/v2ray-qos/main/install.sh)
```
🛠 قابلیت‌ها

    محدودسازی بر اساس پورت (مثلاً 2026)
    عدم تاثیر روی SSH و پنل مدیریت
    تشخیص خودکار کارت شبکه (eth0, ens3, …)
    امکان تغییر سرعت بدون نیاز به ریستارت سرور

📖 نحوه استفاده

بعد از اجرای اسکریپت:

    پورت V2Ray را وارد کنید (مثلاً 2026)
    سرعت مورد نظر را به Mbps وارد کنید (مثلاً 10)

دستورات کنترلی

مشاهده وضعیت:

```bash
tc -s class show dev eth0
```

حذف محدودیت:
```bash
tc qdisc del dev eth0 root
iptables -t mangle -F
```
🐧 سیستم‌عامل‌های پشتیبانی شده

    Ubuntu 20.04 / 22.04 / 24.04 ✅
    Debian 11 / 12 ✅
    CentOS 7+ ⚠️ آزمایشی

🤝 مشارکت

اگر ایده‌ای برای بهتر شدن اسکریپت داری، می‌تونی Pull Request بفرستی یا Issue ثبت کنی.

</div>

<p align=“center”>

Developed with ❤️ for the Community

</p>
