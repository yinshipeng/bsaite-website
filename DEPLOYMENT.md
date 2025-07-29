# 芭赛特网站部署指南

## 一键启动网站

### 使用caddy.json配置

#### 生产环境 - HTTP
```bash
# 前台启动
./start.sh http

# 后台启动
./start.sh http --background
# 或
./start.sh http -b
```

#### 生产环境 - HTTPS
```bash
# 前台启动
./start.sh https

# 后台启动
./start.sh https --background
# 或
./start.sh https -b
```

#### 服务管理
```bash
# 查看服务状态
./start.sh status

# 停止服务
./start.sh stop

# 查看日志
./start.sh logs
```

## 安装依赖

### 系统要求
- Node.js 18+ 
- pnpm
- Caddy 2.7+

### 安装步骤

1. **安装Node.js**
   ```bash
   # macOS
   brew install node
   
   # Ubuntu/Debian
   curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
   sudo apt-get install -y nodejs
   
   # Windows
   # 从 https://nodejs.org/ 下载安装
   ```

2. **安装pnpm**
   ```bash
   npm install -g pnpm
   ```

3. **安装Caddy**
   ```bash
   # macOS
   brew install caddy
   
   # Ubuntu/Debian
   sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
   curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
   curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
   sudo apt update
   sudo apt install caddy
   
   # Windows
   # 从 https://caddyserver.com/docs/install 下载
   ```

4. **安装项目依赖**
   ```bash
   pnpm install
   ```

## 配置文件说明

### caddy.json
- JSON格式的Caddy配置
- 只包含生产环境配置
- 支持HTTP和HTTPS服务器
- 自动HTTPS证书管理

## 常用命令

```bash
# 构建生产版本
pnpm build

# 预览构建结果
pnpm preview

# 使用Caddy启动（前台）
./start.sh http
./start.sh https

# 使用Caddy启动（后台）
./start.sh http --background
./start.sh https --background

# 服务管理
./start.sh status    # 查看服务状态
./start.sh stop      # 停止服务
./start.sh logs      # 查看日志
```

## 访问地址

- 生产环境 (HTTP)：http://localhost
- 生产环境 (HTTPS)：https://localhost

## HTTPS配置说明

### 本地HTTPS测试
使用 `./start.sh https` 启动时，Caddy会自动生成自签名证书：
- 浏览器会显示安全警告，这是正常现象
- 点击"高级" -> "继续访问"即可查看网站
- 证书有效期为30天，会自动续期

### 生产环境HTTPS配置
要使用真实域名和有效证书，请修改caddy.json中的域名配置：

```json
{
  "apps": {
    "http": {
      "servers": {
        "prod_https": {
          "listen": [":443"],
          "routes": [
            {
              "handle": [
                {
                  "handler": "file_server",
                  "root": "./.output/public"
                }
              ]
            },
            {
              "match": [
                {
                  "not": [
                    {
                      "file": {
                        "try_files": ["{path}", "/index.html"]
                      }
                    }
                  ]
                }
              ],
              "handle": [
                {
                  "handler": "rewrite",
                  "uri": "/index.html"
                }
              ]
            }
          ],
          "automatic_https": {
            "disable": false
          }
        }
      }
    },
    "tls": {
      "automation": {
        "policies": [
          {
            "subjects": ["your-domain.com"],
            "issuers": [
              {
                "module": "acme"
              }
            ]
          }
        ]
      }
    }
  }
}
```

### 支持的DNS提供商
Caddy支持多种DNS提供商的自动证书申请：
- Cloudflare
- AliDNS (阿里云)
- Tencent Cloud DNS (腾讯云)
- DNSPod
- 更多提供商请参考：https://caddyserver.com/docs/automatic-https#dns-providers

## 故障排除

### 端口占用
如果端口被占用，可以修改配置文件中的端口号：
- HTTP: 修改 `:80` 为其他端口
- HTTPS: 修改 `:443` 为其他端口

### 权限问题
在Linux/macOS上，确保脚本有执行权限：
```bash
chmod +x start.sh
```

### HTTPS证书问题
如果遇到证书错误：
1. 确保没有其他服务占用443端口
2. 检查防火墙设置
3. 验证Caddy配置：
   ```bash
   caddy validate --config caddy.json
   ```

### Caddy配置验证
```bash
caddy validate --config caddy.json
```

### 后台运行日志
后台运行时，日志保存在 `caddy.log` 文件中：
```bash
# 查看实时日志
tail -f caddy.log

# 查看最后100行日志
tail -100 caddy.log
