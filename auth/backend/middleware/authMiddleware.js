const jwt = require('jsonwebtoken'); 

const authenticateToken = (req, res, next) => {
  // Middleware a kérés csak akkor folytatódik, ha érvényes a token.

  const authHeader = req.headers['authorization'];
  // Megkeressük az Authorization fejlécet a kérésben, amely tartalmazza a tokent.
  
  const token = authHeader && authHeader.split(' ')[1];
  // Ha az Authorization fejléc létezik, kiválasztjuk belőle a tokent.

  if (!token) return res.status(401).json({ message: 'Token not found' });
  // Ha nincs token a fejlécben, visszaadunk egy 401-es státuszkódot.

  jwt.verify(token, 'your_secret_key', (err, user) => {
    // A jwt.verify() függvénnyel ellenőrizzük a tokent. Ha érvényes, visszakapjuk a benne tárolt felhasználói adatokat (pl. userId).

    if (err) return res.status(403).json({ message: 'Token is not valid' });
    // Ha a token érvénytelen (pl. lejárt vagy hibás), 403-as státuszkódot küldünk vissza .

    req.user = user;
    // Ha a token érvényes, a benne lévő felhasználói adatokat hozzáadjuk a kéréshez (req.user), így a későbbi middleware-ek vagy útvonalak is elérhetik azokat.

    next();
    // Meghívjuk a next() függvényt, amely tovább engedi a kérést a következő middleware vagy útvonalkezelő felé.
  });
};

module.exports = authenticateToken;

